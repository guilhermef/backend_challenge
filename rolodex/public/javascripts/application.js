$(document).ready(function() {
  function loadContacts(q){
    var url = "/contacts.partial"
    if ( typeof(q) != 'undefined'){
      url += "?q="+q;
    }
    $('#contacts').load(url);
  };loadContacts();
 
  $(".remote-popin").live("click", function(event){
    var url = $(this).attr("href");
    event.preventDefault();
    $(".popin-mask").load(url, function(){
      $(this).dialog({modal:true});
      $(this).ajaxSuccess(function(e, xhr, settings){
        if (settings.url == '/contacts'){
          $(this).html(xhr.responseText);
          loadContacts();
        };
      });
    });
  });
  
  $(".remote-show").live("click", function(event){
    var url = $(this).attr("href");
    event.preventDefault();
    $("#workspace").load(url);
  });
  
  $("input[name='search']").keyup( function() {
    var q = $(this).val().trim();
    q != "" ? loadContacts(q) : loadContacts()
  });
  
});
