// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function get_price_first_column(id) {
	var price = 0;
	$('table#product_table_' + id + ' tr').each(function() {
			var td_value = $(this).find("td").eq(1).html();
			price = td_value.split("::");
	});
	return price[1].split("$")[1];
}

function get_price_second_column(id) {
	var price = 0;
	$('table#product_table_' + id + ' tr').each(function() {
			var td_value = $(this).find("td").eq(2).html();
			if (td_value == null){
				price = 0;
			}else{
				price = td_value.split("::")[1].split("$")[1];
			}
			
	});
	return price;
}

function get_lowest_price_product(priceOne, priceTwo) {
	
	if (parseFloat(priceTwo) == 0 || parseFloat(priceOne) < parseFloat(priceTwo)) {
		return 1;
	} else {
		return 2;
	}
}