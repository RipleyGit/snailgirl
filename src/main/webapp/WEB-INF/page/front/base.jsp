<link href="${sod}/staticfile/front/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${sod}/staticfile/front/js/jquery-1.7.2.min.js"></script>
<%--<script src="${sod}/staticfile/front/js/jquery-1.4.2.js"></script>--%>
<!-- Custom Theme files -->
<link href="${sod}/staticfile/front/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->

<!--Animation-->
<script src="${sod}/staticfile/front/js/wow.min.js"></script>
<link href="${sod}/staticfile/front/css/animate.css" rel='stylesheet' type='text/css' />
<script>
    new WOW().init();
</script>
<script type="text/javascript" src="${sod}/staticfile/front/js/move-top.js"></script>
<script type="text/javascript" src="${sod}/staticfile/front/js/easing.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
        });

    });
</script>