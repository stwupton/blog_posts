@echo off
call pub run blog_posts:update
call "buildfeed.bat"
