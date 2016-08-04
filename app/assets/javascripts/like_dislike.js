var configureLikeDislike = function(parent){
  var upvote = $(parent).find('.upvote').closest('div');
  upvote.click(function(event){
      var target = $(event.currentTarget).closest('div.likes-container');
      var serviceId = $(target).data('service');

      var endPoint = 'like';
      var currentClass = 'fa-thumbs-o-up';
      var newClass = 'fa-thumbs-up';
     if($(target).find('i').hasClass('fa-thumbs-up')){
         endPoint = 'dislike';
         currentClass = 'fa-thumbs-up';
         newClass = 'fa-thumbs-o-up';
     }

      $.ajax('/servicos/'+serviceId+'/'+endPoint, {
          method: 'PUT',
          success: function(data) {
              switchClasses(target,'i',currentClass, newClass);
              // switchClasses(target,'i','fa-thumbs-down', 'fa-thumbs-o-down');
              updateNumbers(target, data.upvotes, data.downvotes);
            },
            error: function() {
               console.log('Oops');
            }
      });

  });

  var downvote = $(parent).find('.downvote').closest('div');
  downvote.click(function(event){
      var target = $(event.currentTarget).closest('div.likes-container');
      console.log(target);
      var serviceId = $(target).data('service');
      $.ajax('/servicos/'+serviceId+'/dislike', {
          method: 'PUT',
          success: function(data) {
              // switchClasses(target,'i','fa-thumbs-up', 'fa-thumbs-o-up');
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

(function($, window, document) {
  'use strict';

  $(function() {
    var ready = function(){
        configureLikeDislike(document);
    };

    $(document).ready(ready);
  });

}(window.jQuery, window, document));
