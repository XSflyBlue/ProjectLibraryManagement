<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> 统计与分析-大学生创新创业训练项目库管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="apple-touch-icon-precomposed" href="../assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="../assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="../assets/css/admin.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/app.css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css">
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body data-type="index">

    <%@include file='../common/header-login.jsp' %>
    
    <div class="tpl-page-container">
    
    <%@include file='../manager/indexmenu.jsp' %>

        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                统计与分析
            </div>
            <ol class="am-breadcrumb">
                <li>统计与分析视图</li>
                <li class="am-active">内容</li>
            </ol>
            
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 统计与分析视图
                    </div>
                </div>
                <div class="am-g" id="addbutton">
                
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12">
							<form class="am-form">
								<div class="caption font-green bold">
									<span class="am-icon-code"></span> 项目类型统计
								</div>
								<div class="am-tabs tpl-index-tabs" data-am-tabs>
									<ul class="am-tabs-nav am-nav am-nav-tabs">
										<li class="am-active"><a href="#tab1">项目级别统计</a></li>
										<li><a href="#tab2">项目类型统计</a></li>
										<li><a href="#tab3">项目学科类别统计</a></li>
										<li><a href="#tab4">项目安排统计</a></li>
									</ul>
									<div class="am-tabs-bd">
										<div class="am-tab-panel am-fade am-in am-active" id="tab1">
											<div class="tpl-echarts tpl-chart-mb" id="echarts1-1"></div>
										</div>
										<div class="am-tab-panel am-fade" id="tab2">
											<div class="tpl-echarts tpl-chart-mb" id="echarts1-2"></div>
										</div>
										<div class="am-tab-panel am-fade" id="tab3">
											<div class="tpl-echarts tpl-chart-mb" id="echarts1-3"></div>
										</div>
										<div class="am-tab-panel am-fade" id="tab4">
											<div class="tpl-echarts tpl-chart-mb" id="echarts1-4"></div>
										</div>
									</div>
								</div>
								<hr>
								<div class="caption font-green bold">
									<span class="am-icon-code"></span> 项目进度统计
								</div>
								<div class="tpl-echarts tpl-chart-mb" id="echarts2">

								</div>
								<hr>
								<div class="caption font-green bold">
									<span class="am-icon-code"></span> 项目成员统计
								</div>
								<div class="tpl-echarts tpl-chart-mb" id="echarts3">

								</div>
								<hr>
							</form>
						</div>
                   </div>
                   
               </div>
           </div>
        </div>
    </div>
	
	
	<%@include file='../common/footer.jsp' %>

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/amazeui.min.js"></script>
    <script src="../assets/js/iscroll.js"></script>
    <script src="../assets/js/app.js"></script>
    <script src="../assets/js/echarts.min.js"></script>
    <script src="../js/moment.js"></script>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/myScript.js"></script>
    <script src="../js/jquery-ui.min.js"></script>


</body>
<script type="text/javascript">
//项目级别
function chartOneOne(){
	var countryNum = 0;
	var provinceNum = 0;
	var schoolNum = 0;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/statistics/pblevel',
        data:'type=1',
        success:function(data){//返回json结果
        	if(data!=null&&data!=''){
        		countryNum = data.countryNum;
        		provinceNum = data.provinceNum;
        		schoolNum = data.schoolNum;
			}else{
				return;
			}
        },
        complete:function()
        {
        	var dom = document.getElementById("echarts1-1");
        	var myChart = echarts.init(dom);
        	var app = {};
        	option = null;
        	option = {
        	    title : {
        	        text: '项目级别统计',
        	        x: 'center'
        	    },
        	    tooltip: {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: ['国家级','省部级','校级']
        	    },
        	    series : [
        	        {
        	            name: '项目级别',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:[
        	                {value:countryNum, name:'国家级'},
        	                {value:provinceNum, name:'省部级'},
        	                {value:schoolNum, name:'校级'}
        	            ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};

        	app.currentIndex = -1;

        	setInterval(function () {
        	    var dataLen = option.series[0].data.length;
        	    // 取消之前高亮的图形
        	    myChart.dispatchAction({
        	        type: 'downplay',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	    app.currentIndex = (app.currentIndex + 1) % dataLen;
        	    // 高亮当前图形
        	    myChart.dispatchAction({
        	        type: 'highlight',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	    // 显示 tooltip
        	    myChart.dispatchAction({
        	        type: 'showTip',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	}, 1000);
        	;
        	if (option && typeof option === "object") {
        	    myChart.setOption(option, true);
        	}
        }
    }); 
}
//项目类别
function chartOneTwo() {
	var typeonenum = 0;
	var typetwonum = 0;

	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/statistics/pbtype',
        data:'type=1',
        success:function(data){//返回json结果
        	if(data!=null&&data!=''){
        		typeonenum = data.typeonenum;
        		typetwonum = data.typetwonum;
			}else{
				return;
			}
        },
        complete:function()
        {
        	var dom = document.getElementById("echarts1-2");
        	var myChart = echarts.init(dom);
        	var app = {};
        	option = null;
        	option = {
        	    title : {
        	        text: '项目类型统计',
        	        x: 'center'
        	    },
        	    tooltip: {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: ['大学生创新创业训练','大学生科研训练计划']
        	    },
        	    series : [
        	        {
        	            name: '项目类型',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:[
        	                {value:typeonenum, name:'大学生创新创业训练'},
        	                {value:typetwonum, name:'大学生科研训练计划'}
        	            ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};

        	app.currentIndex = -1;

        	setInterval(function () {
        	    var dataLen = option.series[0].data.length;
        	    // 取消之前高亮的图形
        	    myChart.dispatchAction({
        	        type: 'downplay',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	    app.currentIndex = (app.currentIndex + 1) % dataLen;
        	    // 高亮当前图形
        	    myChart.dispatchAction({
        	        type: 'highlight',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	    // 显示 tooltip
        	    myChart.dispatchAction({
        	        type: 'showTip',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	}, 1000);
        	;
        	if (option && typeof option === "object") {
        	    myChart.setOption(option, true);
        	}
        }
    }); 
}

function chartOneThree() {
	var typeonenum = 0;
	var typetwonum = 0;

	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/statistics/pbsubject',
        data:'type=1',
        success:function(data){//返回json结果
        	if(data!=null&&data!=''){
        		typeonenum = data.typeonenum;
        		typetwonum = data.typetwonum;
			}else{
				return;
			}
        },
        complete:function()
        {
        	var dom = document.getElementById("echarts1-3");
        	var myChart = echarts.init(dom);
        	var app = {};
        	option = null;
        	option = {
        	    title : {
        	        text: '项目学科类别',
        	        x: 'center'
        	    },
        	    tooltip: {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: ['工学硬件','软件及其他']
        	    },
        	    series : [
        	        {
        	            name: '学科类别',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:[
        	                {value:typeonenum, name:'工学硬件'},
        	                {value:typetwonum, name:'软件及其他'}
        	            ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};

        	app.currentIndex = -1;

        	setInterval(function () {
        	    var dataLen = option.series[0].data.length;
        	    // 取消之前高亮的图形
        	    myChart.dispatchAction({
        	        type: 'downplay',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	    app.currentIndex = (app.currentIndex + 1) % dataLen;
        	    // 高亮当前图形
        	    myChart.dispatchAction({
        	        type: 'highlight',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	    // 显示 tooltip
        	    myChart.dispatchAction({
        	        type: 'showTip',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	}, 1000);
        	;
        	if (option && typeof option === "object") {
        	    myChart.setOption(option, true);
        	}
        }
    }); 
}

function chartOneFour() {
	var dataname = new Array();
	var datavalue = new Array();
	var longdata = [];
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/statistics/pbplan',
        data:'type=1',
        success:function(data){//返回json结果
        	if(data!=null&&data!=''){
        		for(var i=0;i<data.length;i++){
        			dataname[i] = data[i].ppname;
        			datavalue[i] = data[i].pbnum;
        			var temp = {value:datavalue[i], name:dataname[i]};
        			longdata.push(temp);
        		}
			}else{
				return;
			}
        },
        complete:function()
        {
        	var dom = document.getElementById("echarts1-4");
        	var myChart = echarts.init(dom);
        	var app = {};
        	option = null;
        	option = {
        	    title : {
        	        text: '项目学科类别',
        	        x: 'center'
        	    },
        	    tooltip: {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: dataname
        	    },
        	    series : [
        	        {
        	            name: '学科类别',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:longdata,
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};

        	app.currentIndex = -1;

        	setInterval(function () {
        	    var dataLen = option.series[0].data.length;
        	    // 取消之前高亮的图形
        	    myChart.dispatchAction({
        	        type: 'downplay',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	    app.currentIndex = (app.currentIndex + 1) % dataLen;
        	    // 高亮当前图形
        	    myChart.dispatchAction({
        	        type: 'highlight',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	    // 显示 tooltip
        	    myChart.dispatchAction({
        	        type: 'showTip',
        	        seriesIndex: 0,
        	        dataIndex: app.currentIndex
        	    });
        	}, 1000);
        	;
        	if (option && typeof option === "object") {
        	    myChart.setOption(option, true);
        	}
        }
    }); 
}

function chartTwo(){
	var typeonenum = 0;
	var typetwonum = 0;
	var typethreenum = 0;
	var typefournum = 0;
	var typefivenum = 0;
	var typesixnum = 0;
	
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/statistics/pbstatus',
        data:'type=1',
        success:function(data){//返回json结果
        	if(data!=null&&data!=''){
        		typeonenum = data.typeonenum;
        		typetwonum = data.typetwonum;
        		typethreenum = data.typethreenum;
        		typefournum = data.typefournum;
        		typefivenum = data.typefivenum;
        		typesixnum = data.typesixnum;
			}else{
				return;
			}
        },
        complete:function()
        {
        	var dom = document.getElementById("echarts2");
        	var myChart = echarts.init(dom);
        	var app = {};
        	option = null;
        	option = {
        	    tooltip: {},
        	    legend: {
        	        data:['项目数']
        	    },
        	    xAxis: {
        	        data: ["立项中","中期检查中","验收中","已结题","优秀项目","其他情况"]
        	    },
        	    yAxis: {},
        	    series: [{
        	        name: '项目数',
        	        type: 'bar',
        	        data: [typetwonum, typethreenum, typefournum, typeonenum,typefivenum,typesixnum]
        	    }]
        	};;
        	if (option && typeof option === "object") {
        	    myChart.setOption(option, true);
        	}
        }
    }); 
}

function chartThree(){
	var dataname = new Array();
	var datavalue = new Array();
	var longdata = [];
	
	var role = "${user.role}";
	if(role==2){
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/statistics/pbcolstudent',
	        data:'college=${user.college}',
	        success:function(data){//返回json结果
	        	if(data!=null&&data!=''){
	        		for(var i=0;i<data.length;i++){
	        			dataname[i] = data[i].major;
	        			datavalue[i] = data[i].manum;
	        			var temp = {value:datavalue[i], name:dataname[i]};
	        			longdata.push(temp);
	        		}
				}else{
					return;
				}
	        },
	        complete:function()
	        {
	        	var dom = document.getElementById("echarts3");
	        	var myChart = echarts.init(dom);
	        	var app = {};
	        	option = null;
	        	option = {
	        	    title : {
	        	        text: '项目成员统计',
	        	        x: 'center'
	        	    },
	        	    tooltip: {
	        	        trigger: 'item',
	        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	        	    },
	        	    legend: {
	        	        orient: 'vertical',
	        	        left: 'left',
	        	        data: dataname
	        	    },
	        	    series : [
	        	        {
	        	            name: '人数',
	        	            type: 'pie',
	        	            radius : '55%',
	        	            center: ['50%', '60%'],
	        	            data:longdata,
	        	            itemStyle: {
	        	                emphasis: {
	        	                    shadowBlur: 10,
	        	                    shadowOffsetX: 0,
	        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	        	                }
	        	            }
	        	        }
	        	    ]
	        	};

	        	app.currentIndex = -1;

	        	setInterval(function () {
	        	    var dataLen = option.series[0].data.length;
	        	    // 取消之前高亮的图形
	        	    myChart.dispatchAction({
	        	        type: 'downplay',
	        	        seriesIndex: 0,
	        	        dataIndex: app.currentIndex
	        	    });
	        	    app.currentIndex = (app.currentIndex + 1) % dataLen;
	        	    // 高亮当前图形
	        	    myChart.dispatchAction({
	        	        type: 'highlight',
	        	        seriesIndex: 0,
	        	        dataIndex: app.currentIndex
	        	    });
	        	    // 显示 tooltip
	        	    myChart.dispatchAction({
	        	        type: 'showTip',
	        	        seriesIndex: 0,
	        	        dataIndex: app.currentIndex
	        	    });
	        	}, 1000);
	        	;
	        	if (option && typeof option === "object") {
	        	    myChart.setOption(option, true);
	        	}
	        }
	    }); 
	}else if(role==1){
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/statistics/pbstudent',
	        data:'type=1',
	        success:function(data){//返回json结果
	        	if(data!=null&&data!=''){
	        		for(var i=0;i<data.length;i++){
	        			dataname[i] = data[i].college;
	        			datavalue[i] = data[i].colnum;
	        			var temp = {value:datavalue[i], name:dataname[i]};
	        			longdata.push(temp);
	        		}
				}else{
					return;
				}
	        },
	        complete:function()
	        {
	        	var dom = document.getElementById("echarts3");
	        	var myChart = echarts.init(dom);
	        	var app = {};
	        	option = null;
	        	option = {
	        	    title : {
	        	        text: '项目成员统计',
	        	        x: 'center'
	        	    },
	        	    tooltip: {
	        	        trigger: 'item',
	        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	        	    },
	        	    legend: {
	        	        orient: 'vertical',
	        	        left: 'left',
	        	        data: dataname
	        	    },
	        	    series : [
	        	        {
	        	            name: '人数',
	        	            type: 'pie',
	        	            radius : '55%',
	        	            center: ['50%', '60%'],
	        	            data:longdata,
	        	            itemStyle: {
	        	                emphasis: {
	        	                    shadowBlur: 10,
	        	                    shadowOffsetX: 0,
	        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	        	                }
	        	            }
	        	        }
	        	    ]
	        	};

	        	app.currentIndex = -1;

	        	setInterval(function () {
	        	    var dataLen = option.series[0].data.length;
	        	    // 取消之前高亮的图形
	        	    myChart.dispatchAction({
	        	        type: 'downplay',
	        	        seriesIndex: 0,
	        	        dataIndex: app.currentIndex
	        	    });
	        	    app.currentIndex = (app.currentIndex + 1) % dataLen;
	        	    // 高亮当前图形
	        	    myChart.dispatchAction({
	        	        type: 'highlight',
	        	        seriesIndex: 0,
	        	        dataIndex: app.currentIndex
	        	    });
	        	    // 显示 tooltip
	        	    myChart.dispatchAction({
	        	        type: 'showTip',
	        	        seriesIndex: 0,
	        	        dataIndex: app.currentIndex
	        	    });
	        	}, 1000);
	        	;
	        	if (option && typeof option === "object") {
	        	    myChart.setOption(option, true);
	        	}
	        }
	    }); 
	}
}

$(function(){
	$('#j_analyse').addClass("active");
	$('#j_center').removeClass("nav-link active");
	$('#j_center').addClass("nav-link tpl-left-nav-link-list");
	
	//第一类
	chartOneOne();
	chartOneTwo();
	chartOneThree();
	chartOneFour();
	//第二类
	chartTwo();
	//第三类
	chartThree();
});
</script>
</html>