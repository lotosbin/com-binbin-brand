<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Google App Engine: Code Lab 2</title>


<jsp:include page="/shared/head.html" />
</head>

<body>

	<jsp:include page="/shared/header.html" />
	<!-- content -->
	<div id="gc-pagecontent">
		<h1 class="page_title">Code Lab Example 2</h1>

		<!-- tabs -->
		<div id="tabs" class="gtb">
			<a id="home" href="#home" class="tab">Home</a> <a id="customer"
				href="#customer" class="tab">Customer</a> <a id="product"
				href="#product" class="tab">Product</a> <a id="item" href="#item"
				class="tab">Item</a> <a id="order" href="#order" class="tab">Order</a>
			<div class="gtbc"></div>
		</div>
		<!-- home page content -->
		<div class="g-unit" id="home-tab">
			<h2>Create Flow Chart</h2>
			<p>
				<div align="left">
					<img src="images/codeLab2Create.png" />
				</div>

				<ol>
					<li>Product/Item servlet will be invoked on <b>Save</b> click
						from UI</li>
					<li>doPut() method of respective servlet will invoke <b>datastore
							API</b> to persist the data into datastore</li>
					<li>Also, the same data copy is pushed into memcache store.</li>
				</ol>
			</p>

			<h2>List Flow Chart</h2>
			<p>
				<div align="left">
					<img src="images/codeLab2List.png" />
				</div>

				<ol>
					<li>On UI tab selection, doGet() of the respective servlet
						gets called</li>
					<li>Call to memcache store (using memcache API) is made to
						check whether the entity requested is available in memcache store.</li>
					<li>If the data is not present in cache store then, call will
						be forwarded to datastore.</li>
					<li>JSON objects are returned to the UI and custom JSON
						converter will parse the JSON objects</li>
				</ol>
			</p>
		</div>
		<!-- ******************************************* customer ******************************************* -->
		<div class="g-unit" id="customer-tab">
			<div class="message" id="customer-show-message" style="display: none">
			</div>
			<!-- search container -->
			<div class="gsc-search-box" id="customer-search-ctr">
				<!-- section title -->
				<h2>All Customers</h2>
				<form name="customer-search-form" id="customer-search-form">
					<label>Name</label> <input type="text" name="q" id="q"
						class="gsc-input" /> <input type="button" value="Search"
						onclick="search('customer')" class="gsc-search-button" /> <input
						type="button" value="Add" onclick="add('customer')"
						class="gsc-search-button" /> <input type="reset"
						id="customer-search-reset" class="cancel" title="Reset"
						value="Reset" style="visibility: hidden" />
				</form>
			</div>
			<!-- list container -->
			<div class="results" style="border: 0;" id="customer-list-ctr">
				<table width="100%" cellspacing="0" cellpadding="2" border="0"
					style="border-collapse: collapse;">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">Address</th>
							<th scope="col">Phone</th>
							<th scope="col">Email</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="customer-list-tbody"></tbody>
				</table>
			</div>
			<div class="create-ctr" id="customer-create-ctr">
				<h2>Create Customer</h2>
				<form name="customer-create-form" id="customer-create-form">
					<table width="200" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td>Name</td>
								<td><span class="readonly"><input type="text"
										style="width: 185px;" autocomplete="off" class="gsc-input"
										maxlength="2048" name="name" id="name" /> </span></td>
							</tr>

							<tr>
								<td>First Name</td>
								<td><input type="text" style="width: 185px;"
									autocomplete="off" class="gsc-input" maxlength="2048"
									name="firstName" id="firstName" /></td>
							</tr>
							<tr>
								<td>Last Name</td>
								<td><input type="text" style="width: 185px;"
									autocomplete="off" class="gsc-input" maxlength="2048"
									name="lastName" id="lastName" /></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><input type="text" style="width: 185px;"
									autocomplete="off" class="gsc-input" maxlength="2048"
									name="address" id="address" /></td>
							</tr>
							<tr>
								<td>City</td>
								<td><input type="text" style="width: 185px;"
									autocomplete="off" class="gsc-input" maxlength="2048"
									name="city" id="city" /></td>
							</tr>
							<tr>
								<td>State</td>
								<td><input type="text" style="width: 185px;"
									autocomplete="off" class="gsc-input" maxlength="2048"
									name="state" id="state" /></td>
							</tr>
							<tr>
								<td>Zip</td>
								<td><input type="text" style="width: 185px;"
									autocomplete="off" class="gsc-input" maxlength="2048"
									name="zip" id="zip" /></td>
							</tr>
							<tr>
								<td>Phone</td>
								<td><input type="text" style="width: 185px;"
									autocomplete="off" class="gsc-input" maxlength="2048"
									name="phone" id="phone" /></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="text" style="width: 185px;"
									autocomplete="off" class="gsc-input" maxlength="2048"
									name="eMail" id="eMail" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="button" class="save" title="Save"
									value="Save" onclick="formValidate('customer')" /> <input
									type="button" class="cancel" title="Cancel" value="Cancel"
									onclick="cancel('customer')" /> <input type="reset"
									id="customer-reset" class="cancel" title="Reset" value="Reset"
									style="visibility: hidden" />
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>

		</div>


		<!-- ******************************************* product ******************************************* -->
		<div class="g-unit" id="product-tab">
			<div class="message" id="product-show-message" style="display: none">
			</div>
			<!-- search container -->
			<div class="gsc-search-box" id="product-search-ctr">
				<!-- section title -->
				<h2>All Products</h2>
				<form name="product-search-form" id="product-search-form">
					<label>Name</label> <input type="text" name="q" id="q"
						class="gsc-input" /> <input type="button" value="Search"
						onclick="search('product')" class="gsc-search-button" /> <input
						type="button" value="Add" onclick="add('product')"
						class="gsc-search-button" /> <input type="reset"
						id="product-search-reset" class="cancel" title="Reset"
						value="Reset" style="visibility: hidden" />
				</form>
			</div>
			<!-- list container -->
			<div class="results" style="border: 0;" id="product-list-ctr">
				<table width="100%" cellspacing="0" cellpadding="2" border="0"
					style="border-collapse: collapse;">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Description</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="product-list-tbody"></tbody>
				</table>
			</div>

			<!-- create container -->
			<div class="create-ctr" id="product-create-ctr">
				<h2>Create Product</h2>
				<form name="product-create-form" id="product-create-form">
					<table width="200" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td>Name</td>
								<td><span class="readonly"><input type="text"
										style="width: 185px;" autocomplete="off" class="gsc-input"
										maxlength="2048" name="name" id="name" /> </span></td>
							</tr>
							<tr>
								<td>Description</td>
								<td><input type="text" style="width: 185px;"
									autocomplete="off" class="gsc-input" maxlength="2048"
									name="description" id="description" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="button" class="save" title="Save"
									value="Save" onclick="formValidate('product')" /> <input
									type="button" class="cancel" title="Cancel" value="Cancel"
									onclick="cancel('product')" /> <input type="reset"
									id="product-reset" class="cancel" title="Reset" value="Reset"
									style="visibility: hidden" />
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>

		</div>
		<!-- ******************************************* item ******************************************* -->
		<div class="message" id="item-show-message" style="display: none">
		</div>
		<div class="g-unit" id="item-tab">
			<!-- search container -->
			<div class="gsc-search-box" id="item-search-ctr">
				<!-- section title -->
				<h2>All Items</h2>
				<form name="item-search-form" id="item-search-form">
					<input type="text" name="q" id="q" class="gsc-input" /> <select
						id="by" name="item-searchby" class="gsc-input">
						<option value="name">Item</option>
						<option value="product">Product</option>
					</select> <input type="button" value="Search" onclick="search('item')"
						class="gsc-search-button" /> <input type="button" value="Add"
						onclick="add('item')" class="gsc-search-button" /> <input
						type="reset" id="item-search-reset" class="cancel" title="Reset"
						value="Reset" style="visibility: hidden" />
				</form>
			</div>
			<!-- list container -->
			<div class="results" style="border: 0;" id="item-list-ctr">
				<table width="100%" cellspacing="0" cellpadding="2" border="0"
					style="border-collapse: collapse;">
					<thead>
						<tr>
							<th scope="col">Item Name</th>
							<th scope="col">Selling Price</th>
							<th scope="col">Product</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="item-list-tbody"></tbody>
				</table>
			</div>
			<!-- create container -->
			<div class="create-ctr" id="item-create-ctr">
				<h2>Create Item</h2>
				<form name="item-create-form" id="item-create-form">
					<table width="200" cellspacing="0" cellpadding="0">
						<tr>
							<td>Item Name</td>
							<td><span class="readonly"><input type="text"
									style="width: 185px;" autocomplete="off" class="gsc-input"
									maxlength="2048" name="name" id="name" /> </span></td>
						</tr>
						<tr>
							<td>Selling Price</td>
							<td><input type="text" style="width: 185px;"
								autocomplete="off" class="gsc-input" maxlength="2048"
								name="price" id="price" /></td>
						</tr>
						<tr>
							<td>Product</td>
							<td><select id="item-product-list" name="product"></select>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="button" class="save" title="Save"
								value="Save" onclick="formValidate('item')" /> <input
								type="button" class="cancel" title="Cancel" value="Cancel"
								onclick="cancel('item')" /> <input type="reset" id="item-reset"
								class="cancel" title="Reset" value="Reset"
								style="visibility: hidden" />
							</td>
						</tr>
					</table>
				</form>
			</div>
			<!-- create conatiner ends here -->
		</div>
		<!-- ******************************************* order ******************************************* -->
		<div class="g-unit" id="order-tab">
			<div class="message" id="order-show-message" style="display: none">
			</div>
			<!-- search container -->
			<div class="gsc-search-box" id="order-search-ctr">
				<!-- section title -->
				<h2>All Orders</h2>
				<form name="order-search-form" id="order-search-form">
					<label>Customer Name</label> <input type="text" name="q" id="q"
						class="gsc-input" /> <input type="button" value="Search"
						onclick="search('order')" class="gsc-search-button" /> <input
						type="button" value="Add" onclick="add('order')"
						class="gsc-search-button" /> <input type="reset"
						id="order-search-reset" class="cancel" title="Reset" value="Reset"
						style="visibility: hidden" />
				</form>
			</div>
			<!-- list container -->
			<div class="results" style="border: 0;" id="order-list-ctr">
				<table width="100%" cellspacing="0" cellpadding="2" border="0"
					style="border-collapse: collapse;">
					<thead>
						<tr>
							<th scope="col">Order Id</th>
							<th scope="col">Item Name</th>
							<th scope="col">Customer</th>
							<th scope="col">Ship To</th>
							<th scope="col">Quantity</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="order-list-tbody"></tbody>
				</table>
			</div>
			<!-- create container -->
			<div class="create-ctr" id="order-create-ctr">
				<h2>Create Order</h2>
				<form name="order-create-form" id="order-create-form">
					<table width="200" cellspacing="0" cellpadding="0">
						<tr>
							<td>Customer</td>
							<td><select id="order-customer-list" name="customerName"></select>
							</td>
						</tr>
						<tr>
							<td>Ship To</td>
						</tr>
						<tr>
							<td>Address</td>
							<td><input type="text" style="width: 185px;"
								autocomplete="off" class="gsc-input" maxlength="2048"
								name="shipto" id="shipto" /></td>
						</tr>
						<tr>
							<td>City</td>
							<td><input type="text" style="width: 185px;"
								autocomplete="off" class="gsc-input" maxlength="2048"
								name="city" id="city" /></td>
						</tr>
						<tr>
							<td>State</td>
							<td><input type="text" style="width: 185px;"
								autocomplete="off" class="gsc-input" maxlength="2048"
								name="state" id="state" /></td>
						</tr>
						<tr>
							<td>Zip</td>
							<td><input type="text" style="width: 185px;"
								autocomplete="off" class="gsc-input" maxlength="2048" name="zip"
								id="zip" /></td>
						</tr>
					</table>
					<table width="200" cellspacing="0" cellpadding="0">
						<tr>
							<td>Item</td>
							<td><select id="order-item-list" name="itemName"></select></td>
						</tr>
						<tr>
							<td>Quantity</td>
							<td><input type="text" style="width: 185px;"
								autocomplete="off" class="gsc-input" maxlength="2048"
								name="quantity" id="quantity" /></td>
						</tr>
						<tr>
							<td>Selling Price</td>
							<td><input type="text" style="width: 185px;"
								autocomplete="off" class="gsc-input" maxlength="2048"
								name="price" id="price" /></td>
						</tr>


						<tr>
							<td>&nbsp;</td>
							<td><input type="button" class="save" title="Save"
								value="Save" onclick="formValidate('order')" /> <input
								type="button" class="cancel" title="Cancel" value="Cancel"
								onclick="cancel('order')" /> <input type="reset"
								id="order-reset" class="cancel" title="Reset" value="Reset"
								style="visibility: hidden" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(window).load(function() {
			init();
		});
	</script>
</body>
</html>
