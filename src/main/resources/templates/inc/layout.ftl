<#macro layout title>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="欢迎访问博客网站">
    <meta name="description" content="">
    <link rel="stylesheet" href="/res/layui/css/layui.css">
    <link rel="stylesheet" href="/res/css/global.css">

    <script src="/res/layui/layui.js"></script>
    <script src="/res/js/jquery.min.js"></script>

</head>
<body>

    <#include "/inc/common.ftl" />
    <#include "/inc/header.ftl" />

    <#nested >

<#include "/inc/footer.ftl" />

<script>
    // layui.cache.page = '';
    layui.cache.user = {
        username: '${profile.username!"游客"}'
        ,uid: ${profile.id!"-1"}
        ,avatar: '${profile.avatar!"/res/images/avatar/00.jpg"}'
        ,experience: 83
        ,sex: '${profile.sex!"男"}'
    };

    layui.config({
        version: "3.0.0"
        ,base: '/res/mods/' //这里实际使用时，建议改成绝对路径
    }).extend({
        fly: 'index'
    }).use('fly');
</script>

<script>
    function showTips(count) {
        var msg = $('<a class="fly-nav-msg" href="javascript:;">'+ count +'</a>');
        var elemUser = $('.fly-nav-user');
        elemUser.append(msg);
        msg.on('click', function(){
            location.href = "/user/mess";
        });
        layer.tips('你有 '+ count +' 条未读消息', msg, {
            tips: 3
            ,tipsMore: true
            ,fixed: true
        });
        msg.on('mouseenter', function(){
            layer.closeAll('tips');
        })
    }
</script>

</body>
</html>

</#macro>