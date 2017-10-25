<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Popular-restaurent</title>
	<link href="${ sod }/staticfile/front/css/cartStyle.css" rel='stylesheet' type='text/css' />

	<link href="${ sod }/staticfile/front/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${ sod }/staticfile/front/js/jquery-1.7.2.min.js"></script>
<!-- Custom Theme files -->
<link href="${ sod }/staticfile/front/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<!--Animation-->
<script src="${ sod }/staticfile/front/js/wow.min.js"></script>
<link href="${ sod }/staticfile/front/css/animate.css" rel='stylesheet' type='text/css' />
<script>
	new WOW().init();
</script>
<script type="text/javascript" src="${ sod }/staticfile/front/js/move-top.js"></script>
<script type="text/javascript" src="${ sod }/staticfile/front/js/easing.js"></script>
<script type="text/javascript">


    function formSubmit (url,sTarget){
        document.forms[0].target = sTarget	//在当前页面中进行展现
        document.forms[0].action = url;		//sysadmin/dept/start
        document.forms[0].submit();
        return true;
    }
    $(function () {
  		$("#cartEd").on('click','.countChange a',function(e){
  		    var index = $(e.target).closest('.product').index();

  		    var $e = $(e.target);
            var cartList = $e.closest('.product').find('.delete-item');
            var count = $e.closest('.product').find('[id*=cd-product]');
            if($e.is('.reduce')){
  		       if(count.html()>1){
                   count.html( Number(count.html())-1 );
			   }else{
					cartList.trigger('click');
			   }
		   }else if($e.is('.add')){
               var pid =  $e.closest('.product').find('.delete-item').attr('href');
               $(".Popular-Restaurants-grids").find('[data-proid='+pid+']').trigger('click');
		   }
		});

        var cartWrapper = $('.cd-cart-container');
        //product id - you don't need a counter in your real project but you can use your real product id
        var productId = 0;

        if (cartWrapper.length > 0) {
            //store jQuery objects
            var cartBody = cartWrapper.find('.body')
            var cartList = cartBody.find('ul').eq(0);
            var cartTotal = cartWrapper.find('.checkout').find('span');
            var cartTrigger = cartWrapper.children('.cd-cart-trigger');
            var cartCount = cartTrigger.children('.count')
            //var addToCartBtn = $('.cd-add-to-cart');
            var addToCartBtn = $('.add-button');
            var undo = cartWrapper.find('.undo');
            var undoTimeoutId;

            //quickUpdateCart();


            //add product to cart
            addToCartBtn.on('click', function(event) {
                event.preventDefault();
                addToCart($(this));
            });

            //open/close cart
            cartTrigger.on('click', function(event) {
                event.preventDefault();
                toggleCart();
            });

            //close cart when clicking on the .cd-cart-container::before (bg layer)
            cartWrapper.on('click', function(event) {
                if ($(event.target).is($(this)))
                    toggleCart(true);
            });

            //delete an item from the cart
            cartList.on('click', '.delete-item', function(event) {
                event.preventDefault();
                removeProduct($(event.target).parents('.product'));
                //ajax删除购物中商品
				var pid= $(event.target).attr("href");

                var resStatus= updateCart(pid,-1);
                if(resStatus == false){
                    return false;
                }

            });

            //update item quantity
            cartList.on('change', 'select', function(event) {
                quickUpdateCart();
            });

            //reinsert item deleted from the cart
            undo.on('click', 'a', function(event) {
                clearInterval(undoTimeoutId);
                event.preventDefault();
                cartList.find('.deleted').addClass('undo-deleted').one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function() {
                    $(this).off('webkitAnimationEnd oanimationend msAnimationEnd animationend').removeClass('deleted undo-deleted').removeAttr('style');
                    quickUpdateCart();
                });
                undo.removeClass('visible');
            });
        }

        function toggleCart(bool) {
            var cartIsOpen = (typeof bool === 'undefined') ? cartWrapper.hasClass('cart-open') : bool;

            if (cartIsOpen) {
                cartWrapper.removeClass('cart-open');
                //reset undo
                clearInterval(undoTimeoutId);
                undo.removeClass('visible');
                cartList.find('.deleted').remove();

                setTimeout(function() {
                    cartBody.scrollTop(0);
                    //check if cart empty to hide it
                    if (Number(cartCount.find('li').eq(0).text()) == 0)
                        cartWrapper.addClass('');
                }, 500);
            } else {
                cartWrapper.addClass('cart-open');
            }
        }

        function addToCart(trigger) {
            var cartIsEmpty = cartWrapper.hasClass('empty');
            //update cart product list
            var price = trigger.data('price'),
                proname = trigger.data('proname'),
                proid = trigger.data('proid'),
                proimg = trigger.data('proimg');
            //触发添加购物车ajax

            var resStatus= updateCart(proid,1);
            if(resStatus == false){
                return false;
            }

            addProduct(proname, proid, price, proimg);
            //console.log();

            //update number of items
            updateCartCount(cartIsEmpty);
            //update total price
            updateCartTotal(trigger.data('price'), true);
            //show cart
            cartWrapper.removeClass('empty');
        }

        function addProduct(proname, proid, price, proimg) {
            //this is just a product placeholder
            //you should insert an item with the selected product info
            //replace productId, productName, price and url with your real product info
            productId = productId + 1;

            var quantity = $("#cd-product-" + proid).text();
            var select = '', productAdded = '';

            //console.log(Number(quantity));
            //console.log(quantity);

            if (quantity == '') {
                var select = '<span class="select">x<i id="cd-product-' + proid + '">1</i></span>';
                var productAdded = $('<li class="product"><div class="product-image"><a href="#0"><img src="' + proimg + '" alt="placeholder"></a></div><div class="product-details"><h3 style="position:relative;height: 30px;"><a href="#0">' + proname + '</a><span class="countChange" style="border: 1px solid transparent;position: absolute;right:0;">\n' +
                    '\t\t\t\t\t\t\t\t\t\t\t<a href="javascript:;" class="reduce btn btn-xs btn-default" style="width:22px;text-align:center">-</a>\n' +
                    '\t\t\t\t\t\t\t\t\t\t\t<a href="javascript:;" class="add btn btn-xs btn-default" style="width:22px;text-align: center">+</a>\n' +
                    '\t\t\t\t\t\t\t\t\t\t</span></h3><span class="price">￥' + price + '</span><div class="actions"><a href="'+proid+'" class="delete-item">删除</a><div class="quantity"><label for="cd-product-' + proid + '">件数</label>' + select + '</div></div></div></li>');
                cartList.prepend(productAdded);
            } else {
                quantity = parseInt(quantity);
                //var select = '<span class="select">x<i id="cd-product-'+proid+'">'+quantity+'</i></span>';
                $("#cd-product-" + proid).html(quantity + 1);
            }


            //var productAdded = $('<li class="product"><div class="product-image"><a href="#0"><img src="img/product-preview.png" alt="placeholder"></a></div><div class="product-details"><h3><a href="#0">'+proname+'</a></h3><span class="price">��'+price+'</span><div class="actions"><a href="#0" class="delete-item">ɾ��</a><div class="quantity"><label for="cd-product-'+ proid +'">����x</label><span class="select"><select id="cd-product-'+ proid +'" name="quantity"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option></select></span></div></div></div></li>');
            //cartList.prepend(productAdded);
        }

        function removeProduct(product) {
            clearInterval(undoTimeoutId);
            cartList.find('.deleted').remove();

            var topPosition = product.offset().top - cartBody.children('ul').offset().top,
                productQuantity = Number(product.find('.quantity').find('.select').find('i').text()),
                productTotPrice = Number(product.find('.price').text().replace('￥', '')) * productQuantity;



            product.css('top', topPosition + 'px').addClass('deleted');

            //update items count + total price
            updateCartTotal(productTotPrice, false);
            updateCartCount(true, -productQuantity);
            undo.addClass('visible');

            //wait 8sec before completely remove the item
            undoTimeoutId = setTimeout(function() {
                undo.removeClass('visible');
                cartList.find('.deleted').remove();
            }, 8000);
        }

        function quickUpdateCart() {
            var quantity = 0;
            var price = 0;

            cartList.children('li:not(.deleted)').each(function() {
                var singleQuantity = Number($(this).find('.select').find('i').text());
                quantity = quantity + singleQuantity;
                price = price + singleQuantity * Number($(this).find('.price').text().replace('￥', ''));
            });

            cartTotal.text(price.toFixed(2));
            cartCount.find('li').eq(0).text(quantity);
            cartCount.find('li').eq(1).text(quantity + 1);
        }

        function updateCartCount(emptyCart, quantity) {
            if (typeof quantity === 'undefined') {
                var actual = Number(cartCount.find('li').eq(0).text()) + 1;
                var next = actual + 1;

                if (emptyCart) {
                    cartCount.find('li').eq(0).text(actual);
                    cartCount.find('li').eq(1).text(next);
                } else {
                    cartCount.addClass('update-count');

                    setTimeout(function() {
                        cartCount.find('li').eq(0).text(actual);
                    }, 150);

                    setTimeout(function() {
                        cartCount.removeClass('update-count');
                    }, 200);

                    setTimeout(function() {
                        cartCount.find('li').eq(1).text(next);
                    }, 230);
                }
            } else {
                var actual = Number(cartCount.find('li').eq(0).text()) + quantity;
                var next = actual + 1;

                cartCount.find('li').eq(0).text(actual);
                cartCount.find('li').eq(1).text(next);
            }
        }

        function updateCartTotal(price, bool) {
            bool ? cartTotal.text((Number(cartTotal.text()) + Number(price)).toFixed(2)) : cartTotal.text((Number(cartTotal.text()) - Number(price)).toFixed(2));
        }

        function updateCart(pid,val) {
            $.ajax({
                type:"post",
                url:"${ sod }/prod/updateCart/"+pid+"/"+val,
				contentType:"application/json;charset=utf-8",
				dataType:"json",
				async:false,
                success:function () {
					alert("hello");
                },
                error:function()
                {
                    //出错时回调该函数
					return false;
                    alert("error");
                }
            });
        }

    });


</script>

</head>
<body>


    <!-- header-section-starts -->
	<%@include file="head.jsp"%>
	<!-- header-section-ends -->
	<!-- content-section-starts -->
	<!-- 分页隐藏域 -->
	<div class="Popular-Restaurants-content">
		<div class="Popular-Restaurants-grids">
			<div class="container">
				<c:forEach items="${productList}" var="p">
				<div class="Popular-Restaurants-grid wow fadeInRight" data-wow-delay="0.4s">
					<div class="col-md-3 restaurent-logo">
						<a href="javascript:void(0)"><img src="${ sod }/prod/productImage?prodImg=${p.prodImg}" class="img-responsive" alt="" /></a>
					</div>
					<div class="col-md-3 restaurent-title">
						<div class="logo-title">
							<h4 name=""><a href="#">菜品名称</a></h4>
						</div>
						<div class="rating">
							<h3>${p.prodName}</h3>
						</div>
					</div>
					<div class="col-md-4 restaurent-title">
						<div class="logo-title">
							<h4><a href="#">菜品评价</a></h4>
						</div>
						<div class="rating">
							<h1 style="font-size: 26px">${p.prodDes}</h1>
						</div>
					</div>
					<div class="col-md-2 buy">
						<span>￥${p.prodPrice}</span>
						<input type="hidden" name="prodId" value="${p.prodId}"/>
						<a href="#0" class="btn btn-success add-button" data-proid="${p.prodId}" data-price="${p.prodPrice}" data-proname="${p.prodName}" data-proimg="${ sod }/prod/productImage?prodImg=${p.prodImg}">添加到购物车</a>
					</div>
					<div class="clearfix"></div>
				</div>
				</c:forEach>
			</div>
			<!--分页标签-->
			<div class="container" align="center">
			<ul class="pagination">
				<li <c:if test="${page==1}">class="previous disabled"</c:if>><a href="${sod}/prod/ProductListByType?page=${page-1}&prodType=${prodType}">&laquo;</a></li>

				<li><a href="${sod}/prod/ProductListByType?page=${page-4}&prodType=${prodType}" <c:if test="${maxPage>=page+1 || page-4<=0}">hidden="hidden"</c:if>>${page-4}</a></li>
				<li><a href="${sod}/prod/ProductListByType?page=${page-3}&prodType=${prodType}" <c:if test="${maxPage>=page+2 || page-3<=0}">hidden="hidden"</c:if>>${page-3}</a></li>
				<li><a href="${sod}/prod/ProductListByType?page=${page-2}&prodType=${prodType}" <c:if test="${maxPage>=page+3 || page-2<=0}">hidden="hidden"</c:if>>${page-2}</a></li>
				<li><a href="${sod}/prod/ProductListByType?page=${page-1}&prodType=${prodType}" <c:if test="${maxPage>=page+4 || page-1<=0}">hidden="hidden"</c:if>>${page-1}</a></li>
				<li class="active"><a href="${sod}/prod/ProductListByType?page=${page}&prodType=${prodType}">${page}</a></li>
				<li><a href="${sod}/prod/ProductListByType?page=${page+1}&prodType=${prodType}" <c:if test="${maxPage<page+1}">hidden="hidden"</c:if>>${page+1}</a></li>
				<li><a href="${sod}/prod/ProductListByType?page=${page+2}&prodType=${prodType}" <c:if test="${maxPage<page+2}">hidden="hidden"</c:if>>${page+2}</a></li>
				<li><a href="${sod}/prod/ProductListByType?page=${page+3}&prodType=${prodType}" <c:if test="${maxPage<page+3}">hidden="hidden"</c:if>>${page+3}</a></li>
				<li><a href="${sod}/prod/ProductListByType?page=${page+4}&prodType=${prodType}" <c:if test="${maxPage<page+4}">hidden="hidden"</c:if>>${page+4}</a></li>

				<li <c:if test="${page+1>maxPage}">class="next disabled"</c:if>><a href="${sod}/prod/ProductListByType?page=${page+1}&prodType=${prodType}">&raquo;</a></li>
			</ul>
			</div>
		</div>
	</div>
	<!-- content-section-ends -->

	<%@include file="foot.jsp"%>
	<c:set var="totalCount" value="0"></c:set>
	<c:forEach items="${ cartMap }" var="entry">
		<c:set var="totalCount" value="${ totalCount + entry.value }"></c:set>
	</c:forEach>
	<!-- 购物车 start-->
	<div class="cd-cart-container ">
		<a href="#0" class="cd-cart-trigger">
			购物车
			<ul class="count"> <!-- cart items count -->
				<li>${ totalCount }</li>
				<li>${ totalCount }</li>
			</ul> <!-- .count -->
		</a>

		<div class="cd-cart">
			<div class="wrapper">
				<header>
					<h2 style="padding-top:15px;">购物车</h2>
					<span class="undo">已删除 <a href="#0">恢复</a></span>
				</header>

				<div class="body">
					<ul id="cartEd">
						<!-- products added to the cart will be inserted here using JavaScript -->
						<c:set var="totalMoney" value="0"></c:set>


						<c:forEach items="${ cartMap }" var="entry">
							<li class="product">
								<div class="product-image">
									<a href="#0"><img src="${ sod }/prod/productImage?prodImg=${entry.key.prodImg}" alt="placeholder"></a>
								</div>
								<div class="product-details">
									<h3 style="position:relative;height: 30px;">
										<a href="#0">${entry.key.prodName}</a>
										<span class="countChange" style="border: 1px solid transparent;position: absolute;right:0;">
											<a href="javascript:;" class="reduce btn btn-xs btn-default" style="width:22px;text-align:center">-</a>
											<a href="javascript:;" class="add btn btn-xs btn-default" style="width:22px;text-align: center">+</a>
										</span>
									</h3>
									<span class="price">￥ ${entry.key.prodPrice} </span>
									<div class="actions">
										<a href="${entry.key.prodId}" class="delete-item">删除</a>
										<div class="quantity">
											<label for="cd-product-' + ${entry.key.prodId} + '">件数 </label> <span class="select">x<i id="cd-product-${entry.key.prodId}">${entry.value}</i></span>
										</div>
									</div>
								</div>
							</li>
							<c:set var="totalMoney" value="${ totalMoney + entry.key.prodPrice * entry.value }"></c:set>
							<c:set var="totalCount" value="${ totalCount + entry.value }"></c:set>
						</c:forEach>
					</ul>
				</div>
				<footer>
					<a href="${ sod }/order/toOrder" class="checkout"><em>结算 : ￥<span>${ totalMoney }</span></em></a>
				</footer>
			</div>
		</div> <!-- .cd-cart -->
	</div>
	<!-- 购物车 end-->
</body>
</html>