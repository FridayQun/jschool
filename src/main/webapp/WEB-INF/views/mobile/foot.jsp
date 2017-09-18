<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="downmesgurl" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="zh">
<style>
#cnzz_stat_icon_1263531026 img {
display: initial;
    width: initial;
    border-style: initial;
}
</style>
<script >
	var downmesgurl='${downmesgurl}';
</script>
<body>
  <div class="footer">
    <div class="footer-inner">
      <div class="copyright-desc">
         <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1263531026'%3E%3C/span%3E"));</script>
  <script src='http://s13.cnzz.com/z_stat.php?id=1263531026&show=pic' type='text/javascript'></script>
  </p>
      </div>
    </div>
  </div>
  <div class="overlay sms-box hide">
    <div class="send-box">
      <form class="sendForm" action="#" method="post">
        <div class="form-group"><span class="to-user"></span></div>
        <div class="form-group">
          <textarea name="message-input" id="message-input"></textarea>
        </div>
        <div class="form-submit"><input type="submit" name="submit" value="发 送"></div>
      </form>
    </div>
  </div>
</body>

</html>
