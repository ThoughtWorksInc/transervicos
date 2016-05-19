(function($, window, document) {
  'use strict';

  $(function() {

    var ready = function(){
        var upvote = $('.upvote').closest('div');
        upvote.click(function(event){
            var target = $(event.currentTarget).closest('div.likes-container');
            var serviceId = $(target).data('service');
            $.ajax('/servicos/'+serviceId+'/like', {
                method: 'PUT',
                success: function(data) {
                    switchClasses(target,'i','fa-thumbs-o-up', 'fa-thumbs-up');
                    switchClasses(target,'i','fa-thumbs-down', 'fa-thumbs-o-down');
                    updateNumbers(target, data.upvotes, data.downvotes);
                  },
                  error: function() {
                     console.log('Oops');
                  }
            });
        });

        var downvote = $('.downvote').closest('div');
        downvote.click(function(){
            var target = $(event.currentTarget).closest('div.likes-container');
            var serviceId = $(target).data('service');
            $.ajax('/servicos/'+serviceId+'/dislike', {
                method: 'PUT',
                success: function(data) {
                    switchClasses(target,'i','fa-thumbs-up', 'fa-thumbs-o-up');
                    switchClasses(target,'i','fa-thumbs-o-down', 'fa-thumbs-down');
                    updateNumbers(target, data.upvotes, data.downvotes);
                  },
                  error: function() {
                     console.log('Oops');
                  }
            });
        });

        var updateNumbers = function(parent, upvotes, downvotes){
            var thumbUpNumber = $(parent).find('span.number-thumbs-up');
            thumbUpNumber.html('('+upvotes+')');
            var thumbDownNumber = $(parent).find('span.number-thumbs-down');
            thumbDownNumber.html('('+downvotes+')');
        }

        var switchClasses = function(parent, element, currentClass, newClass){
            $(parent).find(element+'.'+currentClass)
                    .addClass(newClass)
                    .removeClass(currentClass);
        }

    };

    $(document).ready(ready);
  });

}(window.jQuery, window, document));
