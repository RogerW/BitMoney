Polymer('checkbox-input', {
    publish: {
        label:'checkbox',
        input_name:'checkbox'
    }, 
    
    change : function(e, detail, sender){
        var nodes = this.$.content.getDistributedNodes();
        for (var i = 0; i < nodes.length; i++) {
            if(nodes[i].getAttribute("type", "checkbox")) {
                if(sender.getAttribute("aria-checked") == 'true') {
                    nodes[i].checked = false;
                } else {
                    nodes[i].checked = true;
                }
            }

        }

    }
});
