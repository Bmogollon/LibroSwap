function createMessageChannel() {
  App.messages = App.cable.subscriptions.create({
         channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
         },
         {
         received: function(data) {
           $("#messages").removeClass('hidden')
           $("#message_content").val('')
           return $('#messages').append(this.renderMessage(data));
           window.location.reload();
         },
         renderMessage: function(data) {
     return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
   },
       });
 return App.messages;
}
