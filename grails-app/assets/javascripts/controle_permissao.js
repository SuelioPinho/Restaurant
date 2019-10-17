function carregarListaPermissoes(){
    $.ajax({
        method: "POST",
        url: "listarPermissao",
        data: { },
        success: function(data){
            $("#divListaPermissao").html(data)
        }
    })
}
function carregarListaUsuarios(){
    $('#modalUsuario').click();
    $.ajax({
        method: "POST",
        url: "listarUsuario",
        data: { },
        success: function(data){
            $("#divListaUsuario").html(data)
        }
    })
}

$(document).ready(function() {
    carregarListaUsuarios();
    carregarListaPermissoes();
});