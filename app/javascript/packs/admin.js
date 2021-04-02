require("jquery")


$('select[name="product[category_id]"]').change(function(){
    //alert($('#mycontainer').data('source'))
    var n= String($('#mycontainer').data('source'))
    n = n.split(",")
    let sizes=[]
    array=[]
    array = array.concat(n)
    let index = 0
    while ( index < array.length ) {
        let size = {name: ""+array[index]+"", category: array[index+1]}
        sizes.push(size)
        index= index +2
    }
    $('#product_product_characteristics_attributes_0_size_id').find('option').remove()
    let category = $('select[name="product[category_id]"]').val()
    
    sizes.forEach(element => { 
        if(category==element.category){
            $('#product_product_characteristics_attributes_0_size_id').append(
                `<option value="${element.name}">
                                    ${element.name}
                </option>`);
        }
        
    });
    
});