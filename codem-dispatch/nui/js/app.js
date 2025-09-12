import inlineSvg from './util/inlineSvg.js';

const app = new Vue({
    components: {
        'inline-svg'    : inlineSvg,
    },

    el: '#app',

    data: {
        state : false, // 'allDispatchs' || 'notify'

        Config : {},

        Dispatchs : [],

        Notifications : [],

        context : {
            show : false,
            openedId : null,
            top : 0,
            left : 0,
        },

        setNui : false,

        sirenStatus : false,
    },
    
    methods: {

        addNotification(Data) {
            const { notifyTime } = Data;
            const deleteTimeout = notifyTime ? notifyTime : this.Config.NotifyDeleteTimeout * 1000;
        
            this.Notifications.push({
                ...Data,
            });
        
            const audio = new Audio('./assets/sounds/dispatch.ogg');
            audio.volume = 0.1; 
            audio.play();
        
            if (this.Dispatchs.length === this.Config.MaxDispatch) {
                this.Dispatchs.shift();
            }
        
            this.Dispatchs.push({
                ...Data,
            });
        
            const checkAndRemove = () => {
                const indexToRemove = this.Notifications.findIndex(notification => notification.id === Data.id);
                if (indexToRemove !== -1) {
                    this.Notifications.splice(indexToRemove, 1);
                }
            };
        
            setTimeout(checkAndRemove, deleteTimeout);
        },                            

        showContextMenu(event, id) {
            event.preventDefault(); 
            this.context.show = true;
            this.context.openedId = id;
            this.context.top = event.clientY;
            this.context.left = event.clientX;
        },

        hideContextMenu() {
            this.context.show = false;
            this.context.openedId = null;
        },

        calculateTime(time) {
            const timeDifference = (new Date() - new Date(time)) / 1000; 
        
            if (timeDifference < 60) {
                return `${Math.floor(timeDifference)} ` + this.Config.DispatchLocales['UI']['Sec_Ago'];
            } else if (timeDifference < 3600) {
                const minutes = Math.floor(timeDifference / 60);
                return `${minutes} ` + this.Config.DispatchLocales['UI']['Mn_Ago'];
            } else {
                const hours = Math.floor(timeDifference / 3600);
                const minutes = Math.floor((timeDifference % 3600) / 60);
                return `${hours} h ${minutes} ` + this.Config.DispatchLocales['UI']['Mn_Ago'];
            }
        },        

        contextHandle (action) {
            if (action == 'removeCall') {
                const indexToRemove = this.Dispatchs.findIndex(dispatch => dispatch.id === this.context.openedId);
                
                postNUI('REMOVE_DISPATCH', this.context.openedId);
                
                if (indexToRemove !== -1) {
                    this.Dispatchs.splice(indexToRemove, 1);
                }
            } else if (action == 'allCalls') {
                this.state = 'allDispatchs';
            } else if (action == 'markOnMap') {
                postNUI('MARK_DISPATCH_ON_MAP', this.Dispatchs.find(dispatch => dispatch.id === this.context.openedId).coords);
            } else if (action == 'forwardEMS') {
                postNUI('FORWARD_DISPATCH_TO_EMS', this.Dispatchs.find(dispatch => dispatch.id === this.context.openedId));
            } else if (action == 'takeCall') {
                postNUI('TAKE_CALL', this.context.openedId);
                this.hideContextMenu();
                this.state = false;
                postNUI('CLOSE_DISPATCH');
                return;
            }

            if (this.Dispatchs.length == 0) {
                this.closeDispatch();
            }

            this.hideContextMenu();
        },

        closeDispatch () {
            if (this.context.show) {
                this.hideContextMenu();
            } else {
                this.state = false;
                postNUI('CLOSE_DISPATCH');
            }
        },

        keyHandler(event) {
            if (event.key === 'Escape') {
                this.closeDispatch();
            }
        },

        takeCall () {
            var lastNotification = this.Notifications[this.Notifications.length - 1];

            if (lastNotification) {
                postNUI('TAKE_CALL', lastNotification.id);
                this.hideContextMenu();
                this.state = false;
                postNUI('CLOSE_DISPATCH');
            }
        },

        eventHandler (event) {
            const Data = event.data.payload;

            switch (event.data.action) {
                case 'LOAD_NUI':
                    postNUI('NUI_LOADED');
                break;

                case 'INIT_CONFIG':
                    this.Config = Data;
                break;

                case 'SHOW_DISPATCHS':
                    this.state == 'allDispatchs' ? this.state = false : this.state = 'allDispatchs';
                break;

                case 'ADD_DISPATCH':
                    this.addNotification(Data);
                break;

                case 'SET_DISPATCH':
                    this.Dispatchs = Data;
                break;

                case 'UPDATE_DISPATCH':
                    const indexToUpdate = this.Dispatchs.findIndex(dispatch => dispatch.id === Data.id);
                    if (indexToUpdate !== -1) {
                        this.Dispatchs[indexToUpdate] = Data;
                    }
                break;

                case 'TAKE_CALL':
                    this.takeCall();
                break;

                case 'CURSOR_HANDLE':
                    this.setNui = Data;
                break;

                case 'SET_SIREN_STATUS':
                    this.sirenStatus = Data;
                break;
            }
        },
    },

    mounted() {
        window.addEventListener('message', this.eventHandler);
        window.addEventListener('keyup', this.keyHandler);
        document.querySelector('#app').style.display = 'flex';
    },

    computed: {
        
    }
});

if (window.GetParentResourceName) {
    var resourceName = window.GetParentResourceName();
}

window.postNUI = async (name, data) => {
    try {
        const response = await fetch(`https://${resourceName}/${name}`, {
            method: 'POST',
            mode: 'cors',
            cache: 'no-cache',
            credentials: 'same-origin',
            headers: {
            'Content-Type': 'application/json',
            },
            redirect: 'follow',
            referrerPolicy: 'no-referrer',
            body: JSON.stringify(data),
        });
        return !response.ok ? null : response.json();
    } catch (error) {}
};