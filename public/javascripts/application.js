function remove_fields(link) {
    $(link).parent().children().remove();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().children(":first").after(content.replace(regexp, new_id));
}

//This function is used in the versions/new and edit pages to populate the product dropdown based on the manufacturer selection
$(function() {
    $("#version_manufacturer_id").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string === "") {
            // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
            $("#version_product_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("#version_product_id");
        }
        else {
            // Send the request and update product dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/manufacturers/' + id_value_string + '/products.json',
                timeout: 2000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    // Clear all options from  select
                    $("#version_product_id option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "Please Select" + "</option>";
                    $(row).appendTo("#version_product_id");
                    // Fill sub category select
                    $.each(data, function(i, j) {
                        var row = $("<option/>").val(j.product.id).text(j.product.name);
                        $(row).appendTo("#version_product_id");
                    });
                }
            });
        }
        ;
    });
});

//This function is used in the products/new and edit pages to populate the features checklist area based on the manufacturer selection
$(function () {
    $("#version_manufacturer_id").change(function () {
        var id_value_string = $(this).val();
        if (id_value_string === "") {
            $("#version_features_div").empty();
        }
        else {
            // Send the request and update feature checklist
            $.ajax({
                dataType:"json",
                cache:false,
                url:'/manufacturers/' + id_value_string + '/features.json',
                timeout:2000,
                error:function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success:function (data) {
                    $("#version_features_div").empty();
                    $.each(data,function (i,j) {
                        var feature = j.feature.name;
                        var checkbox = $("<input id='version_features_" + j.feature.id + "' name='version[features][]' type='checkbox' value='" + j.feature.id + "' />" + feature + "<br />");
                        $(checkbox).appendTo("#version_features_div");
                    });
                }
            });
        }
        ;
    });
});


//This function is used in the clearance_items/new and edit pages to populate the version dropdown based on the product selection
$(function () {
    $("#clearance_item_product_id").change(function () {
        var id_value_string = $(this).val();
        if (id_value_string === "") {
            // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
            $("#clearance_item_version_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("#clearance_item_version_id");
        }
        else {
            // Send the request and update product dropdown
            $.ajax({
                dataType:"json",
                cache:false,
                url:'/products/' + id_value_string + '/versions.json',
                timeout:2000,
                error:function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success:function (data) {
                    // Clear all options from  select
                    $("#clearance_item_version_id option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "Please Select" + "</option>";
                    $(row).appendTo("#clearance_item_version_id");
                    // Fill sub category select
                    $.each(data, function (i, j) {
                        var row = $("<option/>").val(j.version.id).text(j.version.name);
                        $(row).appendTo("#clearance_item_version_id");
                    });
                }
            });
        }
        ;
    });
});

//This function is used in the images/new and edit pages to populate the model ID dropdown based on the model selection
$(function() {
    $("#image_model").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string === "") {
            // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
            $("#image_model_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("#image_model_id");
        }
        else {
            // Send the request and update product dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/images/' + id_value_string + '/models.json',
                timeout: 2000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    // Clear all options from  select
                    $("#image_model_id option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "Please Select" + "</option>";
                    $(row).appendTo("#image_model_id");
                    // Fill sub category select
                    $.each(data, function(i, j) {
                        //I don't like this multi if statement block, but I'm not sure how else to achieve this.
                        if (j.product) {
                            var row = $("<option/>").val(j.product.id).text(j.product.name);
                        }
                        if (j.paddler) {
                            var row = $("<option/>").val(j.paddler.id).text(j.paddler.name);
                        }
                        if (j.trip) {
                            var row = $("<option/>").val(j.trip.id).text(j.trip.name);
                        }
                        if (j.event) {
                            var row = $("<option/>").val(j.event.id).text(j.event.name);
                        }
                        if (j.waterbody) {
                            var row = $("<option/>").val(j.waterbody.id).text(j.waterbody.name);
                        }
                        $(row).appendTo("#image_model_id");
                    });
                }
            });
        }
        ;
    });
});

$(document).ready(function() {

    /* This is basic - uses default settings */

    $("a.fancybox_images").fancybox({
        'titlePosition'   :    'inside'
    });

    /* Using custom settings */

    /* Apply fancybox to multiple items */

    /*$("a.fatty").fancybox({
        'transitionIn'    :    'elastic',
        'transitionOut'    :    'elastic',
        'speedIn'        :    600,
        'speedOut'        :    200,
        'overlayShow'    :    false
    });*/

});
