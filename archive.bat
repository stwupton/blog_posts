@echo off
call pub run blog_posts:archive
call "buildfeed.bat"
