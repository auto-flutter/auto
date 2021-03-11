@echo off

set FolderName=protos

set OutLib=lib\protos


for /f "delims=\" %%a in ('dir /b /a-d /o-d "%FolderName%\*.proto"') do (
  protoc --proto_path=protos --dart_out=%OutLib% %FolderName%/%%a --plugin "pub run protoc_plugin"
)
pause