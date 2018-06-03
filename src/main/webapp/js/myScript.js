    //导出立项信息
    function exportStart(pId) {
    	var posturl = $('#posturl').val();
    	window.location.href = posturl+'/exportStart?pId='+pId;
	}
    //字符串转时间
    function convertDateFromString(dateString) {
		if (dateString) { 
			var date = new Date(dateString.replace(/-/,"/")) 
			return date;
			}
		}
    //项目详情传值
    function pId(id) {
		$('#postid').val(id);
	}
    //项目详情
	$('#projectdetail').on('show.bs.modal', function () {
		var pId = $('#postid').val();
		var posturl = $('#posturl').val();
		$.ajax({
	        type:'post',
	        url:posturl+'/projectinfo/projectinfo',
	        //数据格式是key/value
	        data:'pId='+pId,
	        success:function(data){//返回json结果
	        	if(data!=null){
                    //项目级别
                    var level='';
                    if(data.pbLevel=='0'){
                    	level='国家级';
                    }else if(data.pbLevel=='1'){
                    	level='省部级';
                    }else if(data.pbLevel=='2'){
                    	level='校级';
                    }
                    //项目类型
                    var type='';
                    if(data.pbType=='0'){
                    	type='大学生创新创业训练';
                    }else if(data.pbType=='1'){
                    	type='大学生科研训练计划';
                    }
                    //项目学科
                    var major='';
                    if(data.subjectType==0){
                    	major = '工学硬件';
                    }else if(data.subjectType==1){
                    	major = '软件及其他';
                    }
                    //项目状态
                    var pbstatus='';
                    if(data.pbStatus==null){
                    	pbstatus='无';
                    }else{
                    	if(data.pbStatus==0){
                        	pbstatus='已结题';
                        }else if(data.pbStatus==1){
                        	pbstatus='立项中';
                        }else if(data.pbStatus==2){
                        	pbstatus='中期检查中';
                        }else if(data.pbStatus==3){
                        	pbstatus='结题验收中';
                        }else if(data.pbStatus==4){
                        	pbstatus='其他情况';
                        }else if(data.pbStatus==5){
                        	pbstatus='优秀项目';
                        }
                    }
                    
                    //项目立项状态
                    var psstatus='';
                    if(data.psiOStatus==null||data.psiOStatus==''){
                    	psstatus='暂无';
                    }else{
                    	if(data.psiOStatus==11){
                        	psstatus='待导师审核';
                        }else if(data.psiOStatus==12){
                        	psstatus='导师审核不通过';
                        }else if(data.psiOStatus==13){
                        	psstatus='待院系审核';
                        }else if(data.psiOStatus==14){
                        	psstatus='院系审核不通过';
                        }else if(data.psiOStatus==15){
                        	psstatus='待教务审核';
                        }else if(data.psiOStatus==16){
                        	psstatus='教务审核不通过';
                        }else if(data.psiOStatus==17){
                        	psstatus='待专家审核';
                        }else if(data.psiOStatus==18){
                        	psstatus='专家审核不通过';
                        }else if(data.psiOStatus==19){
                        	psstatus='立项成功';
                        }else{
                        	psstatus='暂无';
                        }
                    }
                    
                    //项目中期状态
                    var pmstatus='';
                    if(data.pmiOStatus==null||data.pmiOStatus==''){
                    	pmstatus='暂无';
                    }else{
                    	if(data.pmiOStatus==21){
                        	pmstatus='待导师审核';
                        }else if(data.pmiOStatus==22){
                        	pmstatus='导师审核不通过';
                        }else if(data.pmiOStatus==23){
                        	pmstatus='待院系审核';
                        }else if(data.pmiOStatus==24){
                        	pmstatus='院系审核不通过';
                        }else if(data.pmiOStatus==25){
                        	pmstatus='待教务审核';
                        }else if(data.pmiOStatus==26){
                        	pmstatus='教务审核不通过';
                        }else if(data.pmiOStatus==27){
                        	pmstatus='待专家审核';
                        }else if(data.pmiOStatus==28){
                        	pmstatus='专家审核不通过';
                        }else if(data.pmiOStatus==29){
                        	pmstatus='中期合格';
                        }else{
                        	pmstatus='暂无';
                        }
                    }
                    
                    //项目验收状态
                    var pestatus='';
                    if(data.peiOStatus==null||data.peiOStatus==''){
                    	pestatus='暂无';
                    }else{
                    	if(data.peiOStatus==31){
                        	pestatus='待导师审核';
                        }else if(data.peiOStatus==32){
                        	pestatus='导师审核不通过';
                        }else if(data.peiOStatus==33){
                        	pestatus='待院系审核';
                        }else if(data.peiOStatus==34){
                        	pestatus='院系审核不通过';
                        }else if(data.peiOStatus==35){
                        	pestatus='待教务审核';
                        }else if(data.peiOStatus==36){
                        	pestatus='教务审核不通过';
                        }else if(data.peiOStatus==37){
                        	pestatus='待专家审核';
                        }else if(data.peiOStatus==38){
                        	pestatus='专家审核不通过';
                        }else if(data.peiOStatus==39){
                        	pestatus='验收成功';
                        }else{
                        	pestatus='暂无';
                        }
                    }
                    
                    //项目其他状态
                    var postatus='';
                    if(data.poiOStatus==null||data.poiOStatus==''){
                    	postatus='暂无';
                    }else{
                    	if(data.poiOStatus==41){
                        	postatus='待导师审核';
                        }else if(data.poiOStatus==42){
                        	postatus='导师审核不通过';
                        }else if(data.poiOStatus==43){
                        	postatus='待院系审核';
                        }else if(data.poiOStatus==44){
                        	postatus='院系审核不通过';
                        }else if(data.poiOStatus==45){
                        	postatus='待教务审核';
                        }else if(data.poiOStatus==46){
                        	postatus='教务审核不通过';
                        }else if(data.poiOStatus==47){
                        	postatus='待专家审核';
                        }else if(data.poiOStatus==48){
                        	postatus='专家审核不通过';
                        }else if(data.poiOStatus==49){
                        	postatus='其他情况审核成功';
                        }else{
                        	postatus='暂无';
                        }
                    }
                    
                    //项目预算状态
                    var fundstatus='';
                    if(data.fStatus==0){
                    	fundstatus='待添加';
                    }else if(data.fStatus==1){
                    	fundstatus='待审核';
                    }else if(data.fStatus==2){
                    	fundstatus='审核通过';
                    }else if(data.fStatus==3){
                    	fundstatus='审核未通过';
                    }
                    //周报整体状态
                    var weeklystatus='';
                    if(data.wsStatus==0){
                    	weeklystatus='全部通过'
                    }else if(data.wsStatus==1){
                    	weeklystatus='存在不通过'
                    }else if(data.wsStatus==2){
                    	weeklystatus='待添加'
                    }
                    //时间
                    var pmiTime;
                    if(data.pmiTime!=null&&data.pmiTime!=undefined){
                    	pmiTime = moment(data.pmiTime).format('YYYY-MM-DD');
                    }else{
                    	pmiTime = '暂无';
                    }
                    var peiTime;
                    if(data.peiTime!=null&&data.peiTime!=undefined){
                    	peiTime = moment(data.peiTime).format('YYYY-MM-DD');
                    }else{
                    	peiTime = '暂无';
                    }
                    var poiTime;
                    if(data.poiTime!=null&&data.poiTime!=undefined){
                    	poiTime = moment(data.poiTime).format('YYYY-MM-DD');
                    }else{
                    	poiTime = '暂无';
                    }
                    var fOpinionTime;
                    if(data.fOpinionTime!=null&&data.fOpinionTime!=undefined){
                    	fOpinionTime = moment(data.fOpinionTime).format('YYYY-MM-DD');
                    }else{
                    	fOpinionTime = '暂无';
                    }
                    
	        		var projectdetail = '<table class="table table-bordered"><thead><tr>'
	        			+'<th>项目名称</th><th>项目状态</th></tr></thead><tbody><tr>'
	        			+'<td>'+data.pbName+'</td><td>'+pbstatus+'</td>'
	        			+'</tr></tbody></table><table class="table table-bordered"><thead><tr>'
	        			+'<th>项目安排</th><th>创建时间</th><th>修改时间</th></tr></thead><tbody><tr>'
	        			+'<td><a href="#projectplan" data-toggle="modal" onclick="ppId('+data.ppId+')">点击查看</a></td><td>'+moment(data.pbCreateTime).format('YYYY-MM-DD')+'</td><td>'+moment(data.pbEditTime).format('YYYY-MM-DD')+'</td></tr></tbody><thead><tr>'
	        			+'<th>项目级别</th><th>项目类型</th><th>项目学科类别</th></tr></thead><tbody><tr>'
	        			+'<td>'+level+'</td><td>'+type+'</td><td>'+major+'</td></tr></tbody></table>'
	        			+'<table class="table table-bordered"><thead><tr>'
	        			+'<th>项目立项状态</th><th>项目中期状态</th><th>项目中期时间</th><th>项目验收状态</th><th>项目验收时间</th>'
	        			+'</tr></thead><tbody><tr>'
	        			+'<td>'+psstatus+'</td><td>'+pmstatus+'</td><td>'+pmiTime+'</td><td>'+pestatus+'</td><td>'+peiTime+'</td></tr></tbody><thead><tr>'
	        			+'<th>项目日志状态</th><th>项目预算状态</th><th>预算审核时间</th><th>项目其他情况审核状态</th><th>项目其他情况申请时间</th></tr></thead><tbody><tr>'
	        			+'<td>'+weeklystatus+'</td><td>'+fundstatus+'</td><td>'+fOpinionTime+'</td><td>'+postatus+'</td><td>'+poiTime+'</td></tr></tbody></table>'
	        			+'<div><h4>项目简介：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiBrief+'</p></div></div>'
	        			+'<div><h4>申请理由：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiReason+'</p></div></div>'
	        			+'<div><h4>项目方案：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiContent+'</p></div></div>'
	        			+'<div><h4>项目特色与创新点：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiFeature+'</p></div></div>'
	        			+'<div><h4>项目进度安排：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiPlan+'</p></div></div><div>'
	        			+'<h4>项目完成预期成果：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiResult+'</p></div></div>';
	        		$('#j_projectinfo').empty();
	        		$('#j_projectinfo').append(projectdetail);
				}
	        }
	    }); 

	})
	//成员详情传值
	function puid(id) {
		$('#projectuserid').val(id);
	}
    //成员详情
	$('#projectuser').on('show.bs.modal', function () {
		var pId = $('#projectuserid').val();
		var projectuserurl = $('#projectuserurl').val();
		$.ajax({
	        type:'post',
	        url:projectuserurl+'/projectinfo/listprojectuserno',
	        //数据格式是key/value
	        data:'projectid='+pId,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		var projectuser='';
	        		var teacher='';//导师信息
	        		var leader='';//负责人信息
	        		var student='';//其他学生信息
                    //项目状态
                    var pbstatus='';
                    if(data[0].pbStatus==null||data[0].pbStatus==''){
                    	pbstatus='无';
                    }else{
                    	if(data[0].pbStatus==0){
                        	pbstatus='已结题';
                        }else if(data[0].pbStatus==1){
                        	pbstatus='立项中';
                        }else if(data[0].pbStatus==2){
                        	pbstatus='中期检查中';
                        }else if(data[0].pbStatus==3){
                        	pbstatus='结题验收中';
                        }else if(data[0].pbStatus==4){
                        	pbstatus='其他情况';
                        }else if(data[0].pbStatus==4){
                        	pbstatus='优秀项目';
                        }
                    }
	        		projectuser = '<table class="table table-bordered"><thead><tr><th>项目名称</th><th>项目状态</th></tr></thead>'
	        			+'<tbody><tr><td>'+data[0].pbName+'</td><td>'+pbstatus+'</td></tr></tbody></table>';
	        		for(var i=0;i<data.length;i++){
	        			if(data[i].uType==0){
	        				leader ='<caption>成员信息</caption><table class="table table-bordered"><thead><tr>'
	        					+'<th>学生姓名</th><th>学院</th><th>学号</th><th>联系电话</th><th>E-mail</th></tr></thead><tbody>'
	        					+'<tr><td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].uCode+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td></tr>';
	        			}else if(data[i].uType==1){
	        				student+='<tr><td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].uCode+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td></tr>';
	        			}else if(data[i].uType==2){
	        				teacher='<caption>导师信息</caption><table class="table table-bordered"><thead><tr>'
	        					+'<th>导师姓名</th><th>学院</th><th>职称/职务</th><th>联系电话</th><th>E-mail</th></tr></thead><tbody><tr>'
	        					+'<td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].jobTitle+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td></tr></tbody></table>';
	        			}
	        		}
	        		student +='</tbody></table>';
	        		projectuser += leader+student+teacher;
	        		$('#j_projectuser').empty();
	        		$('#j_projectuser').append(projectuser);
				}
	        }
	    }); 

	})
	//项目安排传值
    function ppId(id) {
		$('#projectplanid').val(id);
	}
	//项目安排详情
	$('#projectplan').on('show.bs.modal', function () {
		var ppid = $('#projectplanid').val();
		var projectplanurl = $('#projectplanurl').val();
		$.ajax({
	        type:'post',
	        url:projectplanurl+'/projectinfo/projectplandetail',
	        //数据格式是key/value
	        data:'planid='+ppid,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		var plan = '<table class="table table-bordered"><thead><tr>'
	        			+'<th>项目计划名称</th><th>年度</th>'
	        			+'</tr></thead><tbody><tr>'
	        			+'<td>'+data.ppName+'</td><td>'+data.ppYear+'</td>'
	        			+'</tr></tbody></table>'
	        			+'<table class="table table-bordered"><caption>时间计划</caption>'
	        			+'<thead><tr>'
	        			+'<th>立项截止时间</th><th>预计中期时间</th><th>预计验收时间</th>'
	        			+'</tr></thead><tbody><tr>'
	        			+'<td>'+moment(data.ppStartTime).format('YYYY-MM-DD')+'</td><td>'+moment(data.ppMidTime).format('YYYY-MM-DD')+'</td><td>'+moment(data.ppEndTime).format('YYYY-MM-DD')+'</td>'
	        			+'</tr></tbody></table><table class="table table-bordered">'
	        			+'<caption>人数计划</caption><thead><tr>'
	        			+'<th>学生人数限制</th><th>年级限制（入学时间）</th><th>导师指导人数限制</th>'
	        			+'</tr></thead><tbody><tr>'
	        			+'<td>'+data.stuNum+'</td><td>'+moment(data.acceptTime).format('YYYY-MM-DD')+'</td><td>'+data.tuStuNum+'</td>'
	        			+'</tr></tbody></table>';
	        		$('#j_projectplan').empty();
	        		$('#j_projectplan').append(plan);
	        	}else{
	        		$('#j_projectplan').empty();
	        		$('#j_projectplan').append('<h4>无数据<span class="close" data-close="note"></span></h4>');
	        	}
	        }
	    }); 

	})