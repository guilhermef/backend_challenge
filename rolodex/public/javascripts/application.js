$(document).ready(function() {
  function clearWorkspace(){
    $("#workspace").html("");
  };
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
      $(this).dialog({modal:true,
                      title:"Contact",
                      resizable:false,
                      width: 600
      });
      $(this).ajaxSuccess(function(e, xhr, settings){
        if (/^\/contacts$/.test(settings.url)){
          $(this).html(xhr.responseText);
          loadContacts();
        } else if(/^\/contacts\/\d+$/.test(settings.url)){
          $(this).html(xhr.responseText);
          clearWorkspace();
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
  
  $("form#delete-contacts").live("ajax:after", function(){
    clearWorkspace();
    loadContacts();
  });
  
  $('.checkall').click(function () {
		$(this).parents('form:eq(0)').find(':checkbox').attr('checked', this.checked);
	});
  
});
