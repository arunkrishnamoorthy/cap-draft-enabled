sap.ui.define(
    [
        'sap/fe/core/PageController'
    ],
    function(PageController) {
        'use strict';

        return PageController.extend('com.travelapp.fpm.captravelfpm.ext.view.Detail', {

            onEdit: function() {
                let context = this.getView().getBindingContext();
                if(context.getProperty("IsActiveEntity")){ 
                    this.getExtensionAPI().getEditFlow().editDocument(context);
                } else {
                    this.getModel("ui").setProperty("/isEditable",true) 
                }
            },

            onSave: function() {
                this.getExtensionAPI().getEditFlow().saveDocument(this.getView().getBindingContext());
            },

            onBack: function(){
                this.getExtensionAPI().getRouting().navigateToRoute("/");
            },

            onCreatePress: function() {
                let table = this.byId("idBookingTable");
                let binding = table.getBinding("items");
                let newContext = binding.create();
            },

            onCancel: function() {
                this.getExtensionAPI().getEditFlow().cancelDocument(this.getView().getBindingContext());
            }

        });
    }
);
