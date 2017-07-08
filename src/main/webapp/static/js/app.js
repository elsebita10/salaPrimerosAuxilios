$(document).ready(function() {
	
	var same = $("input[name='sameRadios']:checked").val();
    if(same==null){
        $("#sameNo").attr('checked', true);
        $("#fieldset-same").prop("disabled", true);
    }
    
	var traslado = $("input[name='trasladoRadios']:checked").val();
    if(traslado==null){
        $("#trasladoNo").attr('checked', true);
        $("#fieldset-traslado").prop("disabled", true);
    }
    
    $("#sameSi").click(function() {
		$("#fieldset-same").prop("disabled", false);
	});
	$("#sameNo").click(function() {
		$("#fieldset-same").prop("disabled", true);
	});
	
	$("#trasladoSi").click(function() {
		$("#fieldset-traslado").prop("disabled", false);
	});
	$("#trasladoNo").click(function() {
		$("#fieldset-traslado").prop("disabled", true);
	});
});