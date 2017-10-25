<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="special-offers-section">
    <div class="container">
        <div class="special-offers-section-head text-center dotted-line">
            <h4>特价优惠</h4>
        </div>
        <div class="special-offers-section-grids">
            <div class="m_3"><span class="middle-dotted-line"> </span> </div>
            <div class="container">
                <ul id="flexiselDemo3">
                    <li>
                        <div class="offer">
                            <div class="offer-image">
                                <img src="${sod}/staticfile/back/products/caitu/1.jpg" class="img-responsive" alt=""/>
                            </div>
                            <div class="offer-text">
                                <h4>绝味双脆</h4>
                                <p>很好吃的辣椒炒鸡蛋 </p>
                                <input type="button" value="吃我吧">
                                <span></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </li>
                    <li>
                        <div class="offer">
                            <div class="offer-image">
                                <img src="${sod}/staticfile/back/products/caitu/3.jpg" class="img-responsive" alt=""/>
                            </div>
                            <div class="offer-text">
                                <h4>金钱豆腐烧牛腩</h4>
                                <p>限量版 </p>
                                <input type="button" value="吃我吧">
                                <span></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </li>
                    <li>
                        <div class="offer">
                            <div class="offer-image">
                                <img src="${sod}/staticfile/back/products/caitu/10.jpg" class="img-responsive" alt=""/>
                            </div>
                            <div class="offer-text">
                                <h4>毛氏红烧肉</h4>
                                <p>香辣超赞的 </p>
                                <input type="button" value="吃我吧">
                                <span></span>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </li>
                    <li>
                        <div class="offer">
                            <div class="offer-image">
                                <img src="${sod}/staticfile/back/products/caitu/11.jpg" class="img-responsive" alt=""/>
                            </div>
                            <div class="offer-text">
                                <h4>蚂蚁上树粉丝</h4>
                                <p>滋滋作响，超赞的 </p>
                                <input type="button" value="吃我吧">
                                <span></span>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </li>
                </ul>
                <script type="text/javascript">
                    $(window).load(function() {

                        $("#flexiselDemo3").flexisel({
                            visibleItems: 3,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint:480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint:640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint:768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
                <script type="text/javascript" src="${sod}/staticfile/front/js/jquery.flexisel.js"></script>
            </div>
        </div>
    </div>
</div>
