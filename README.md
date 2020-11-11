# 功能清单  
## 门户前端
  新闻动态	/通知公告	/培训专栏	/制度文档	/项目进度	/质量专栏	/荣誉中亚	/知识共享     
## 门户后台   
  [内容发布]     
  新闻发布  /通告发布	/培训发布	/制度文档	/质量建设	/项目管理	/荣誉管理    
  [内容审核]    
  新闻审核  /通告审核	/分享审核	/评论审核    
  [系统管理]    
  新闻类型  /通告类型	/用户管理	/角色管理    
# Documentation(HTTP开发接口)  
https://documenter.getpostman.com/view/10489749/TVemAp6o     
# 前端项目  
https://github.com/maokofan/portalSite_UI_vue 
# 演示地址及帐号   
前台浏览端:  http://fanfanyy.cn:8290/portalSiteTourist/    
后台管理端:  http://fanfanyy.cn:8290/portalSiteManage/     
用户  | 密码  | 用途  | 
-|-|-
test  |     test  |      普通用户    
test1 |     test1 |     测试内容发布者  
test2 |     test2 |    测试内容审核者  
testAdmmin| testAdmin |  测试管理员  
# 部署说明  
1.安装mysql和jdk  
2.新建数据库zytm_news（navicat）  
3.导入sql目录下的sql文件  
4.配置nginx  
5.执行发布版本portalSiteJServer目录下start脚本(windows-start.bat / linux -start.sh)  
nginx.conf中配置示例
```nginx 配置示例
server {
        listen       8290;
        server_name  "";

        location /portalSiteTourist {
            root   /opt/zytm_portalSite;
            index  index.html index.htm;
        }
		location /portalSiteManage {
            root   /opt/zytm_portalSite;
            index  index.html index.htm;
        }
		
		location /portalSite/ {
			proxy_pass http://127.0.0.1:8289/;
                               client_max_body_size 500m;
		}

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
```
