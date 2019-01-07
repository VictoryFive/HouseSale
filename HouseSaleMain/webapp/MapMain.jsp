<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>label制作</title>



<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
<style type="text/css">
ul {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

.menu>ul>li {
	background-color: green;
	float: left;
	width: 205px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	color: white;
	margin-right: 10px;
}

.menu>ul>li:hover {
	background-color: #228B22;
}

.sub_menu {
	display: none;
}

.sub_menu>li {
	background-color: #2F4F4F;
}

.sub_menu>li:hover {
	background-color: #2F4F4F;
}

#container {
	z-index: -1;
	position: absolute;
}
.button{
width:50px;height:22px;line-height:18px;border:0;margin:4px 0 0 10px;
background:url(static/images/timg.jpg);
color:white;
}
</style>


</head>

<body onload="getdata();">
	<div class="main">
		<form action="" method="get">
			<div class="menu">

				<ul>
					 <li  onclick="turntopage()">  首页</li>
					<li>面积
						<div>
							<ul class="sub_menu">
								<li><label><input name="acreage" type="checkbox"
										value="0" />50平米以下 </label> </br><label><input name="acreage"
										type="checkbox" value="50" />50-100平米 </label> </br> <label><input
										name="acreage" type="checkbox" value="100" />100-150平米 </label> </br><label><input
										name="acreage" type="checkbox" value="150" />150-200平米</label> </br></li>

							</ul>
						</div>
					</li>
					<li>户型
						<div>
							<ul class="sub_menu">
								<li>
								<label><input name="htype" type="checkbox"value="1室1厅 " />1室1厅</label>
										 <label><input name="htype"type="checkbox" value="2室1厅" />2室1厅</label> </br>
										 <label><input name="htype" type="checkbox" value="3室1厅" />3室1厅 </label>
										  <label><input name="htype"type="checkbox" value="4室1厅" />4室1厅</label> </br>
										 <label><input name="htype" type="checkbox" value="1室2厅" />1室2厅 </label>
										  <label><input name="htype"type="checkbox" value="2室2厅" />2室2厅</label> </br>
										 <label><input name="htype" type="checkbox" value="3室2厅" />3室2厅 </label>
										 <label><input name="htype" type="checkbox" value="4室2厅" />4室2厅</label> </li>

							</ul>
						</div>
					</li>
					<li>价格
						<div>
							<ul class="sub_menu">
								<li><label><input name="price" type="checkbox"
										value="0" />50万以下 </label> <label><input name="price"
										type="checkbox" value="50" />50-100万 </label> </br> <label><input
										name="price" type="checkbox" value="100" />100-150万 </label> <label><input
										name="price" type="checkbox" value="150" />150-200万</label> </br> <input
									type='button' class='button' value='提交' onclick="get()" /></li>

							</ul>
						</div>
					</li>
					<li>画图找
						<div>
							<ul class="sub_menu">
								<li><input type='button' class='button' value='开启' onclick="stop()" /> <input
									type='button' class='button' value='关闭' onclick="nostop()" /></li>

							</ul>
						</div>
					</li>
				</ul>

			</div>
		</form>
	</div>

	<div style="width: 100%; height: 700px; border: 1px solid gray"
		id="container"></div>
</body>
</html>
<script type="text/javascript">




	addMapOverlay1();//请求坐标


function getdata() {
	
	 timer =  setInterval("addMapOverlay()",1000);//刷新
}


var timer;
 var markers = [];//所有点坐标
 var myLabels = [];
 var markernew = [];//房屋 
 var markernew2 = [];//街道
 var contents = [];//房屋简介
 var adds = [];//区名
 var bdds=[];
 var ply;//覆盖物
 var ply2;
  var nums = new Int8Array(100);//各区房屋数初始让各项均为零


  var map;    //创建地图容器
  var point;      //创建一个点
   var geoc;   //地图解析器
   var localSearch;//地址解析器
   var localSearch2;//地址解析器

 function addMapOverlay1() {

	 map = new BMap.Map("container");    //创建地图容器
	  point = new BMap.Point(120.371473,36.118823);      //创建一个点
	 map.centerAndZoom(point, 13);                       //设立中心点和地图级别，就是初始化地图
	  map.enableScrollWheelZoom(true);  
	  geoc = new BMap.Geocoder(); 

	  

	 $.ajax({ 

	        type:"POST", 
	    
	        url:"${pageContext.request.contextPath}/sc", 
	        success:function(data){ 
	    
	          for(var j=0;j<data.length;j++)  
	          {  
	        	 
	        var newsiteMap = data[j];  
	        var x = newsiteMap.x;
	        var y  = newsiteMap.y;
	        var con = newsiteMap.content;
	        var add  = newsiteMap.add;
	        markers[j]={name:x,age:y};
	        contents[j]= con;
	        adds[j] = add;
	        
	    	 var pointnew = new BMap.Point(markers[j].name,markers[j].age); 
	           geoc.getLocation(pointnew, function (rs) {  
	             var addComp = rs.addressComponents;  
	             var address =addComp.street ;  
	            
	           if  (address !== '')  
                  { 
	        	 
	              localSearch = new BMap.LocalSearch(map);
	             localSearch.search(address);
	      localSearch.setSearchCompleteCallback(function (searchResult) {
	       var poi = searchResult.getPoi(0);
	    
               var pointnew2 = new BMap.Point(poi.point.lng,poi.point.lat); 
	         	              var youLabel = new BMap.Label(address,     //为lable填写内容
	            	  	    {offset:new BMap.Size(-50,-50),                  //label的偏移量，为了让label的中心显示在点上
	            	  	    position:pointnew2});                                //label的位置
	            	  	  youLabel.setStyle({                                   //给label设置样式，任意的CSS都是可以的
	            	  		 borderRadius:"60px", 
	            			    background:"green",   
	            			     opacity: "0.8",  
	            			    fontSize:"12px",               //字号
	            			    border:"0",                    //边
	            			    height:"50px",                //高度
	            			    width:"50px",                 //宽
	            			    textAlign:"center",            //文字水平居中显示
	            			    lineHeight:"50px",            //行高，文字垂直居中显示
	            			    cursor:"pointer"
	            	  	});
	            	  	
	            	  	    
	            	  	markernew2.push(youLabel);
	              
	              
	              
	              
	              
	       });
                  } 
	             
	
	    	 });
  
	               geoc.getLocation(pointnew, function (rs) { 
	            	  
	             var addComp = rs.addressComponents;  
	             var address =addComp.district;  
	                   
	    	 localSearch2 = new BMap.LocalSearch(map);
	    	localSearch2.search(address);
	     
	       　　 localSearch2.setSearchCompleteCallback(function (searchResult) {
	       　
	       　　 	var poi2 = searchResult.getPoi(0);
	   
               var pointnew3 = new BMap.Point(poi2.point.lng,poi2.point.lat); 

  			 for(var i=0;i<nums.length;i++){
  		       if(address==bdds[i]){var tnt=address+nums[i]+"套"}
   }
        
               var youLabel2 = new BMap.Label(tnt,     //为lable填写内容
	            	  	    {offset:new BMap.Size(-50,-50),                  //label的偏移量，为了让label的中心显示在点上
	            	  	    position:pointnew3});                                //label的位置
	            	  	  youLabel2.setStyle({                                   //给label设置样式，任意的CSS都是可以的
	            	  		 borderRadius:"60px", 
	            			    background:"green",   
	            			     opacity: "0.8",  
	            			    fontSize:"12px",               //字号
	            			    border:"0",                    //边
	            			    height:"60px",                //高度
	            			    width:"60px",                 //宽
	            			    textAlign:"center",            //文字水平居中显示
	            			    lineHeight:"50px",            //行高，文字垂直居中显示
	            			    cursor:"pointer"
	            	  	});
	            	
	            	 	 
	            	  	youLabel2.addEventListener("mouseover", function(e){  
	            	  		
	       			   	 this.setStyle({
	       			   		 background:"red",  });
	       			   	 
			             var bdary = new BMap.Boundary();
			            bdary.get(address, function(rs){       //获取行政区域
			          var count = rs.boundaries.length; //行政区域的点有多少个
			             
			          for(var i = 0; i < count; i++){
			        	 ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#458B00"}); //建立多边形覆盖物
			        	
			       
			        	 ply.setFillOpacity("0");
			              map.addOverlay(ply);  //添加覆盖物
			          }    
			    
			      });   
	       		
	       			  	}); 
	            		
	            	  	youLabel2.addEventListener("click", function(){  
	            	  	   map.setZoom(14);  
	            	 	}); 
	            	  	
	            	  	
	            	  	
	            	  		myLabels.push(youLabel2);
	            	 
	            	    
	            	
	            
	       }); 
	               });
	    	
	               
		             if (bdds.indexOf(add) == -1) {
		            	 bdds.push(add); //判断在arr_1数组中是否存在，不存在则push到arr_1数组中
		             }
		             
	        

	    		 //地址解析
	    		  var myIcon = new BMap.Icon("static/images/2.png", new BMap.Size(60,60));  
	    	var marker	 = new BMap.Marker(pointnew,{icon:myIcon});  
	    	 
	    		 markernew.push(marker);


	          }
	          
	          //for
		 
for(var j=0;j<adds.length;j++)  {
	for(var i=0;i<bdds.length;i++)  {
		
		       if(adds[j] == bdds[i]){
		    	   nums[i]++;
		    	  
		       }
			        	 
			          }}


	        },

	         error:function(data){ 
	            alert("faillll"); 
	        }

	        }); 


 }
 /**
  * 
  */
  /**
   * 
   */
   
   /**
    * 
    */
    /**
     * 
     下面是select
     */
     /**
      * 
      */
      
      /**
       * 
       */

     $(function(){

              $(".menu >ul >li").hover(function(){

                 $(this).find(".sub_menu").show();

              },function(){

                 $(this).find(".sub_menu").hide();
              });

            });
 //
    
 //
 function get() {
 	
 	  obj = document.getElementsByName("price");
 	  var check_val = [];
 	  obj2 = document.getElementsByName("acreage");
 	  var check_val2 = [];
 	  obj3 = document.getElementsByName("htype");
 	  var check_val3 = [];
 	   for(var k=0;k<obj.length;k++){
 	        if(obj[k].checked)
 	            check_val.push(obj[k].value);
          
 	    }
 	   for(var y=0;y<obj2.length;y++){
 	        if(obj2[y].checked)
 	            check_val2.push(obj2[y].value);
         
 	    }
 	   for(var x=0;x<obj3.length;x++){
 	        if(obj3[x].checked)
 	            check_val3.push(obj3[x].value);
        
 	    }
 	   check_val.push("1000");//放在最后用于判断是否为空
 	   check_val2.push("1000");
 	   check_val3.push("1000");
 
 	   //
 		 $.ajax({ 

 	       data:{"check_val":check_val,"check_val2":check_val2,"check_val3":check_val3},

 	        type:"post", 
 	        traditional:true,
 	       dataType: 'json',

 	        url:"${pageContext.request.contextPath}/sd", 
 	        
 	        async :false, 
 	        
 	        success:function(data){
 	        	
 	        	markers.length = 0;
 	        	 contents.length = 0;
 	        	 adds.length  = 0;
 	        	 bdds.length = 0;
 	        	 for(var i=0;i<nums.length;i++){ nums[i]=0}
 	        	 myLabels.length = 0;
 	        	 markernew.length = 0;
 	        	 markernew2.length = 0;
 	        	
 	        	for(var j=0;j<data.length;j++)  
 		          {   var newsiteMap = data[j]; 
 		          var x = Number(newsiteMap.x);
 			        var y  = Number(newsiteMap.y);
 			        var con = newsiteMap.content;
 			        var add  = newsiteMap.add;
 			        markers[j]={name:x,age:y};
 			       
 			        var pointnew = new BMap.Point(markers[j].name,markers[j].age); 
 			  	  var myIcon = new BMap.Icon("static/images/2.png", new BMap.Size(60,60));  
 			    	var marker	 = new BMap.Marker(pointnew,{icon:myIcon});  
 			       
 			        
 		    		 markernew.push(marker);
 		    		
 		    		 contents[j]= con;
 		    	
 		    		 adds[j] = add;
 		    		 //
 		    		 geoc.getLocation(pointnew, function (rs) {  
 			             var addComp = rs.addressComponents;  
 			             var address =addComp.street ;  
 			          
 			             //
 			           if  (address !== '')  
 		                  { 
 			        
 			              localSearch = new BMap.LocalSearch(map);
 			             localSearch.search(address);
 			       　　 localSearch.setSearchCompleteCallback(function (searchResult) {
 			       　　　     　var poi = searchResult.getPoi(0);
 			       　　　
 		               var pointnew2 = new BMap.Point(poi.point.lng,poi.point.lat); 
 			    
 			              var youLabel = new BMap.Label(address,     //为lable填写内容
 			            	  	    {offset:new BMap.Size(-50,-50),                  //label的偏移量，为了让label的中心显示在点上
 			            	  	    position:pointnew2});                                //label的位置
 			            	  	  youLabel.setStyle({                                   //给label设置样式，任意的CSS都是可以的
 			            	  		 borderRadius:"60px", 
 			            			    background:"green",   
 			            			     opacity: "0.8",  
 			            			    fontSize:"12px",               //字号
 			            			    border:"0",                    //边
 			            			    height:"50px",                //高度
 			            			    width:"50px",                 //宽
 			            			    textAlign:"center",            //文字水平居中显示
 			            			    lineHeight:"50px",            //行高，文字垂直居中显示
 			            			    cursor:"pointer"
 			            	  	});
 			            	  	markernew2.push(youLabel);
 			              
 			              
 			              
 			              
 			              
 			       });
 		                  } 
 			           

 			     
 			     
 			    	 });
 			           geoc.getLocation(pointnew, function (rs) { 
 			            	  
 				             var addComp = rs.addressComponents;  
 				             var address =addComp.district;  
 				                   
 				    	 localSearch2 = new BMap.LocalSearch(map);
 				    	localSearch2.search(address);
 				     
 				       　　 localSearch2.setSearchCompleteCallback(function (searchResult) {
 				       　
 				       　　 	var poi2 = searchResult.getPoi(0);
 				   
 			               var pointnew3 = new BMap.Point(poi2.point.lng,poi2.point.lat); 
 			               for(var i=0;i<nums.length;i++){
 			      		       if(address==bdds[i]){var tnt=address+nums[i]+"套"}
 			               }
 			               var youLabel2 = new BMap.Label(tnt,     //为lable填写内容
 				            	  	    {offset:new BMap.Size(-50,-50),                  //label的偏移量，为了让label的中心显示在点上
 				            	  	    position:pointnew3});                                //label的位置
 				            	  	  youLabel2.setStyle({                                   //给label设置样式，任意的CSS都是可以的
 				            	  		 borderRadius:"60px", 
 				            			    background:"green",   
 				            			     opacity: "0.8",  
 				            			    fontSize:"12px",               //字号
 				            			    border:"0",                    //边
 				            			    height:"60px",                //高度
 				            			    width:"60px",                 //宽
 				            			    textAlign:"center",            //文字水平居中显示
 				            			    lineHeight:"50px",            //行高，文字垂直居中显示
 				            			    cursor:"pointer"
 				            	  	});

 				            	  	youLabel2.tt = address;
 				            	  	youLabel2.addEventListener("mouseover", function(e){  
 				            			
 					       			   	 this.setStyle({
 					       			   		 background:"red",  });
 					       			//
 					       			    var bdary = new BMap.Boundary();
 							            bdary.get(address, function(rs){       //获取行政区域
 							          var count = rs.boundaries.length; //行政区域的点有多少个
 							             
 							          for(var i = 0; i < count; i++){
 							        	 ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#458B00"}); //建立多边形覆盖物
 							        	
 							       
 							        	 ply.setFillOpacity("0");
 							              map.addOverlay(ply);  //添加覆盖物
 							          }    
 							    
 							      });   
 					       			   	 
 					       			   	 //
 					       			  	});         
 				            		youLabel2.addEventListener("click", function(){  
 					            	  	   map.setZoom(14);  
 					            	 	}); 

 				            	  	myLabels.push(youLabel2);
 				            	
 				 }); 
 				               });
 		    		 
 			           
 			             if (bdds.indexOf(add) == -1) {
 			            	 bdds.push(add); //判断在arr_1数组中是否存在，不存在则push到arr_1数组中
 			             }
 			             
 		    		 
 		    		 
 		    		
 		          
 	     
 		          }//for
 	        	for(var j=0;j<adds.length;j++)  {
 	        		for(var i=0;i<bdds.length;i++)  {
 	        			
 	        			       if(adds[j] == bdds[i]){
 	        			    	   nums[i]++;
 	        			    	  
 	        			       }
 	        				        	 
 	        				          }}
// 	        	
 	        },
 	       
 	         error:function(data){ 
 	            alert("failerer"); 
 	        }

 	        }); 
 }  

 /**
  * 
  */
  /**
   * 
   */

   /**
    * 
    */
    /**
     * 
     */
     /**
      * 
      */
 var dflag="0";  
 var sflag="0";  
 var a1;  
 var b1;  
 var a2;  
 var b2;  
 var polygon="";  
   

 //第一次第二次点击不同事件
 map.addEventListener("click", function(e){   
     if(sflag=="1"){  
         dflag="0"; 
         var a;
       if(a1>a2){a =a1;a1=a2;a2=a;}
       if(b1>b2){b =b1;b1=b2;b2=b;}
      
      // alert("fffff"); 

       $.ajax({ 

  	       data:{"a1":a1,"a2":a2,"b1":b1,"b2":b2},

  	        type:"post", 

  	       dataType: 'json',

  	        url:"${pageContext.request.contextPath}/sg", 
  	        
  	        async : false, 
  	        
  	        success:function(data){ 
  	       
  	        	 for(var j=0;j<data.length;j++)  
  		          {    
  	        		 
  	        		 var newsiteMap = data[j];  
  	     	        var x = newsiteMap.x;
  	     	        var y  = newsiteMap.y;
  	     	        var con = newsiteMap.content;
  	     	        var add  = newsiteMap.add; 
  	     	      var pointnew = new BMap.Point(x,y); 
  	     	    var myIcon = new BMap.Icon("static/images/2.png", new BMap.Size(60,60));  
 		    	var marker	 = new BMap.Marker(pointnew,{icon:myIcon});  
  	     	   var infoWindow = new BMap.InfoWindow(con);
  	    		
  	     	 marker.infoWindow = infoWindow
  	     	   marker.addEventListener("mouseover", function(e){  
  	     			
  	    			this.openInfoWindow(e.target.infoWindow);
  	   			
  	   			 }); 
  	     	marker.addEventListener("click", function(e){  
  			var ln = Number(this.getPosition().lng);
 		     var la =  Number(this.getPosition().lat);
 		     
 		     $.ajax({ 

 			       data:{"lng":ln,"lat":la},

 			        type:"post", 

 			       dataType: 'json',

 			        url:"${pageContext.request.contextPath}/test3", 
 			        
 			        async : false, 
 			        
 			        success:function(data){ 
 			     	
 			        	 var name = data.name;
 		   		     	    var RB = data.RB;
 	    	        var con = data.content;
 	    	        var add  = data.province+data.city+data.distric; 
 	    	        var price = data.price
 	    	        var acreage  = data.acreage;
  	     	        var housetype  = data.housetype;
 	    	        var H_type  = data.H_type;
 	    	        var url = data.url;
 	 	     	      location.href="onehouse.jsp?x="+ln+"&con="+con+"&y="+y+"&add="+add+
 	 	     	    "&area="+acreage+"&housetype="+housetype+"&money="+price+"&types="+H_type+
 	 	     	  "&name="+name+"&RB="+RB+"&url="+url;//需要跳转的地址
 			        
 			        },

 			         error:function(data){ 
 			        	  alert("failyyyy"); 
 			        }

 			        });
 		     
 		
 			 }); 
   		
  	  	        map.addOverlay(marker);  
  		         
  		          
  		          
  		          }
            
  	     
  	        },

  	         error:function(data){ 

  	           alert("faily"); 

  	        }

  	        }); 
          
 		
         
         //
         return;  
     }       
     if(dflag=="1"){  
         a1=Number(e.point.lng);  
         b1=Number(e.point.lat);  
         beginMove();  
     }   
        
 });   
   
   
 function beginMove(){  
     map.addEventListener("mousemove", add_marker);
     
 }  


 function add_marker(e){   
         if(dflag=="1"){  
             if(polygon!=""){  
                 map.removeOverlay(polygon);  
                 polygon="";  
             } 
             a2=Number(e.point.lng);  
             b2=Number(e.point.lat);    
             polygon = new BMap.Polygon([  
               new BMap.Point(a1,b1),  
               new BMap.Point(a2,b1),  
               new BMap.Point(a2,b2),  
               new BMap.Point(a1,b2)  
             ], {strokeColor:"green", strokeWeight:6, strokeOpacity:0.5});  
             map.addOverlay(polygon);  
             sflag="1";  
         }   
     };
     //画框找房开启
  function stop() {
 	   dflag="1";  
 	    sflag="0";
     map.clearOverlays(); 
     clearInterval(timer);
     }
  //画框找房关闭
     function nostop() {
     	 dflag="0";  
          map.clearOverlays(); 
        map.removeEventListener("mousemove", add_marker);

         get();
         timer =  setInterval("addMapOverlay()",1000);
         }
     /**
      * 
      */
      /**
       * 
       */
       /**
        * 
        */
        
        /**
         * 
         */
         /**
          * 
          */
          /**
           * 
           */
      function addMapOverlay() {


         var u = map.getZoom(); // 定义地图缩放等级的变量
     	map.clearOverlays();
     	
     	if( u >= 14 &&u <= 16 ){
     		

     		 for (var index = 0; index < markernew2.length; index++) {
     			 markernew2[index].addEventListener("click", function(e){  
     				  map.setZoom(17);  
     		 			 });
     			 
     			
     			 
     				markernew2[index].addEventListener("mouseover", function(e){  
     		   			//
     					this.setStyle({                                   //给label设置样式，任意的CSS都是可以的
     			    		 background:"red", 
     			    	});
     					
     		 			//
     		 			 });
     				markernew2[index].addEventListener("mouseout", function(e){  
     		   			//
     					this.setStyle({                                   //给label设置样式，任意的CSS都是可以的
     			    		 background:"green", 
     			    	});
     					
     		 			//
     		 			 });
     			 
     			 
     		 map.addOverlay(markernew2[index]);  
     		 }
     		 }
     	else if (u >= 17) {   //

       	 for (var index = 0; index < markernew.length; index++) {
       		 var infoWindow = new BMap.InfoWindow(contents[index]);
       		 markernew[index].infoWindow = infoWindow
       		markernew[index].addEventListener("mouseover", function(e){  
        			
       			this.openInfoWindow(e.target.infoWindow);
      			
      			 }); 
       		 markernew[index].addEventListener("click", function(e){  
         			var ln = this.getPosition().lng;
        		     var la = this.getPosition().lat;
        			
        			 $.ajax({ 

        		       data:{"lng":ln,"lat":la},

        		        type:"post", 

        		       dataType: 'json',

        		        url:"${pageContext.request.contextPath}/test3", 
        		        
        		        async : false, 
        		        
        		        success:function(data){ 
        		        	 //  alert("aaaaa"); 
        		     	    var name = data.name;
        		     	    var RB = data.RB;
      	     	        var x = data.x;
      	     	        var y  = data.y;
      	     	        var con = data.content;
      	     	      
      	     	        var add  = data.province+data.city+data.distric; 
      	     	        var acreage  = data.acreage;
      	     	        var housetype  = data.housetype;
      	     	        var price = data.price
      	     	        var H_type  = data.H_type;
      	     	         var url = data.url;
      	     	      location.href="onehouse.jsp?x="+ln+"&con="+con+"&y="+y+"&add="+add+
      	     	    "&area="+acreage+"&housetype="+housetype+"&money="+price+"&types="+H_type+
      	     	  "&name="+name+"&RB="+RB+"&url="+url;//需要跳转的地址
     	       

        		        },

        		         error:function(data){ 
        		        	    alert("aily"); 
        		        }

        		        }); 
       			 }); 
          		
       		
      	        map.addOverlay(markernew[index]);  
       	 }
       	 

       }
     	
     	
     	else {

     		 for(var q=0;q<myLabels.length;q++)  
      {    
     			 myLabels[q].addEventListener("mouseout", function(e){  
     			
     			   	 this.setStyle({
     			   		 background:"green",  });

     			  	}); 
     		 
     			 
     			 
     			map.addOverlay(myLabels[q]);
     	 }

         }
         
     }

     
      function turntopage(){location.href = "index.jsp";}//跳转首页
      
      
      
	

</script>



</html>