@echo off
call pub run blog_posts:publish
call "buildfeed.bat"
