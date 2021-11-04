# 1. 功能描述
 * 支持小米摄像头1分钟视频合并
 * 按小时合并视频
 * 运行两次，可以再次合并小时视频为每天视频

# 2. 具体使用
## 2.0 配置shell和ffmpeg环境

## 2.1 列表文件+合并文件
    sh merge.sh 788b2acda963

## 2.2 分步执行
### 2.2.0 指定小米视频路径
    修改merge.sh文件：
        midir=788b2acda963
### 2.2.1 生成列表文件
    sh merge.sh list
### 2.2.2 合并文件
    sh merge.sh merge

