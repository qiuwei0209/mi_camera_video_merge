#！/bin/bash

# for file in $(ls 2021110320)
# for file in $(ls ./)
# do
#     if [ "${file##*.}" = "mp4" ]; then
#       echo "file" ${file}
#         # mv ${file} ${file%.*}.c
#     fi
# done

# echo $1

# 视频文件遍历
func_Filelist(){
  dir=$1
  listfile=$dir".txt"

  if [ -f "${listfile}" ]; then
    rm ${listfile}
  fi

  for file in $(ls ${dir})
  do
    if [ "${file##*.}" = "mp4" ]; then
      # echo "file" ${file}
      echo "file" ${dir}"/"${file} >> ${listfile}
    fi
  done
}

# 目录遍历
func_Dirlist(){
  echo "1. 遍历目录，导出文件列表"
  for rootFile in $(ls)
  do
    # if test -f $rootFile
    # then
    #   echo $rootFile 是文件
    # fi
    if  test -d $rootFile
    then
      # echo $rootFile 是目录
      func_Filelist $rootFile
    fi
  done
}

# 文件合并
func_Merge(){
  echo "2. 遍历文件列表，ffmpeg合并文件"
  for rootFile in $(ls)
  do
    if test -f ${rootFile}
    then
      if [ "${rootFile##*.}" = "txt" ]; then
        # echo $rootFile 是文件
        filename=$(echo ${rootFile} | cut -d . -f1)
        ffmpeg -y -f concat -safe 0 -i ${rootFile} -c:v copy -c:a aac -b:a 64k ${filename}.mp4
        # rm ${rootFile}
        dateDir=${filename:0:8}
        mkdir -p ${dateDir}
        mv ${filename}.mp4 ${dateDir}
      fi
    fi
    # if  test -d ${rootFile}
    # then
    # echo ${rootFile} 是目录
    # func_Filelist ${rootFile}
    # fi
  done
}


midir=788b2acda963


if [ ! -z $1 ]; then
  echo $1

  if [ "$1" = "list" ]; then
    cd ${midir}
    func_Dirlist
  elif [ "$1" = "merge" ]; then
    cd ${midir}
    func_Merge
  else
    cd $1
    func_Dirlist
    func_Merge
  fi
else
  echo "cd" ${midir}
  cd ${midir}
  func_Dirlist
  func_Merge
fi


