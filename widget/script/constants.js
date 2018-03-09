/**
 * @brief	app常量定义
 * @author	邓龙
 * @file	constant.js
 * @date	2017-10-17
 */

 //app测试帐号   test01 123456

var ASYNC = true;
var DATATYPE = 'json';
var TIMEOUT = '15';
var GET = 'get';
var POST = 'post';
var HEADERS = {
    'Content-type': 'application/json'
};

// var AJAX_URL_HEAD = "http://47.92.132.2:8080/webapp_api/";
var AJAX_URL_HEAD = "http://www.anhuanzhongxin.com:8080/webapp_api/";

var REQUEST_ERROR = '请求失败';
var USERNAMENULL = '用户名不能为空';
var PASSWORDNULL = '密码不能为空';

// /** ajax提交参数默认值 */
// var AJAX_PARAMETER_POST = {
// 	method : 'post',
// 	cache : true,
// 	timeout : 30,
// 	dataType : 'json',
// 	returnAll : false,
// 	data : {}
// }

//请求失败提示
function request_error_toast(err_msg) {
  if (err_msg) {
    api.toast({
        msg: err_msg,
        duration: 2000,
        location: 'bottom'
    });
  }
  else {
    api.toast({
        msg: REQUEST_ERROR,
        duration: 2000,
        location: 'bottom'
    });
  }
}

//图片上传接口
function uploadImgApi(imgData) {
  api.ajax({
      url: AJAX_URL_HEAD + 'upload/',
      method: POST,
      async: ASYNC,
      dataType: DATATYPE,
      timeout: TIMEOUT,
      data: {
          files:{file:imgData}
      },
  }, function(ret, err) {
      if (ret) {
          if (ret.status == 200) {
            api.sendEvent({
                name: 'uploadImg',
                extra: {
                    data: ret.data
                }
            });
          } else {
              request_error_toast(ret.err_msg);
          }
          console.log(JSON.stringify('返回数据-----' + JSON.stringify(ret)));
      } else {
          request_error_toast();
          console.log(JSON.stringify(err));
      }
  });
  console.log(AJAX_URL_HEAD + 'login/' + '图片上传接口')
}

//获取日期
function getNowFormatDate(str) {
    var date = new Date();
    var seperator1 = "年";
    var seperator2 = "月";
    var seperator3 = "日";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();

    if (str == 8) {
      return strDate - 1;
    }

    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator2;
    if (str == 1) {
        currentdate = month + seperator2 + strDate + seperator3;
    }
    else if (str == 2) {
      currentdate = date.getFullYear() + seperator1 + month + seperator2 + strDate + seperator3;
    }
    else if (str == 3) {
      currentdate = date.getFullYear() + '-' + month + '-' + strDate;
    }
    else if (str == 4) {
      currentdate = date.getFullYear() + '-' + month + '-' + '01';
    }
    else if (str == 5) {
      month = month - 1;
      currentdate = date.getFullYear() + '-' + month;
    }
    else if (str == 7) {
      month = month - 1;
      if (month == 0) {
        currentdate = date.getFullYear()-1 + '-' + 12 + '-' + 31;
      }
      else {
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        currentdate = date.getFullYear() + '-' + month + '-' + 31;
      }
    }

    if (str == 6) {
      month = month - 1;
      alert(month);
      currentdate = date.getFullYear() + seperator1 + month + seperator2;
    }

    return currentdate;
}

function getNowFormat() {
    var date = new Date();
    var seperator1 = "年";
    var seperator2 = "月";
    var seperator3 = "日";
    var month = date.getMonth();
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }

    if (month == 0) {
      month = 12;
      return date.getFullYear()-1 + seperator1 + month + seperator2;
    }

    var currentdate = date.getFullYear() + seperator1 + month + seperator2;

    return currentdate;
  }

function createDateAction(num) {
    var date = new Date();
    var month = date.getMonth() + 1;
    if (num >= 0 && num <= 9) {
        num = "0" + num;
    }
    if (month >= 0 && month <= 9) {
        month = "0" + month;
    }
    var currentdate = date.getFullYear() + '-' + month + '-' + num;

    return currentdate;
}

function createUpDateAction(num) {
    var date = new Date();
    var month = date.getMonth();
    if (num >= 0 && num <= 9) {
        num = "0" + num;
    }

    if (month >= 0 && month <= 9) {
        month = "0" + month;
    }

    var currentdate = date.getFullYear() + '-' + month + '-' + num;
    if (month == 0) {
      currentdate = date.getFullYear()-1 + '-' + 12 + '-' + num;
    }

    return currentdate;
}

//获取年月
function getYearMonthDate() {
    var date = new Date();
    var seperator1 = "年";
    var seperator2 = "月";
    var month = date.getMonth();
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator2;

    return currentdate;
}

//返回当月日期数组
function getDateList(list) {
    var date = new Date();
    var month = date.getMonth() + 1;
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    var currentdate = date.getFullYear();
    var dateSum = getMonthSum();
    var dateList = [];
    for (var i=1; i<dateSum+1; i++) {
      var strDate = i;
      if (i >= 0 && i <= 9) {
          strDate = "0" + i;
      }
      var dateTime = currentdate + '-' + month + '-' + strDate;
      dateList.push(dateTime);
    }

    var myList = [];
    for (var i=0; i<dateList.length; i++) {
      var dateStr = dateList[i];
      var str = list[dateStr];
      if (!str) {
        str = 0;
      }

      var strDay = i+1;
      var dateNum = {"date": strDay, "enable":str, "day":0};
      var strDate = date.getDate();
      if (strDay > strDate) {
        dateNum = {"date": strDay, "enable":2, "day":0};
      }
      if (strDate >= 0 && strDate <= 9) {
          strDate = "0" + strDate;
      }
      var dateTime = currentdate + '-' + month + '-' + strDate;
      if (dateStr == dateTime) {
        dateNum = {"date": strDay, "enable":str, "day":1};
      }
      myList.push(dateNum);
    }
    return myList;
}

function getUpDateList(list) {
    var date = new Date();
    var currentdate = date.getFullYear();
    var month = date.getMonth();
    if (month == 0) {
      month = 12;
      currentdate = currentdate - 1;
    }
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    var dateSum = getUpMonthSum();
    var dateList = [];
    for (var i=1; i<dateSum+1; i++) {
      var strDate = i;
      if (i >= 0 && i <= 9) {
          strDate = "0" + i;
      }
      var dateTime = currentdate + '-' + month + '-' + strDate;
      dateList.push(dateTime);
    }

    var myList = [];
    for (var i=0; i<dateList.length; i++) {
      var dateStr = dateList[i];
      var str = list[dateStr];
      if (!str) {
        str = 0;
      }

      var strDay = i+1;
      var dateNum = {"date": strDay, "enable":str, "day":0};
      myList.push(dateNum);
    }
    return myList;
}

//获取当月天数
function getMonthSum() {
  var date = new Date();
  var month = date.getMonth() + 1;
  var currentdate = date.getFullYear();
  var  day = new Date(currentdate,month,0);
  var daycount = day.getDate();
  return daycount;
}

function getUpMonthSum() {
  var date = new Date();
  var month = date.getMonth();
  var currentdate = date.getFullYear();
  var  day = new Date(currentdate,month,0);
  var daycount = day.getDate();
  return daycount;
}

//获取星期
function getNowWeek(text) {
    var a = new Array("日", "一", "二", "三", "四", "五", "六");
    var week = new Date().getDay();
    var str = text + a[week];
    return str;
}

//加载...
function loadingShow(toast) {
  toast.loading({
              title:"",
              duration:3000
          });
}

function loadingHidden(toast) {
  toast.hide();
}

//判断手机是否android
function isAndroid() {
  var u = navigator.userAgent, app = navigator.appVersion;
  var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1;
  return isAndroid;
}
