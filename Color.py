#!/usr/bin/env python
#coding=utf-8
import os
import sys
import shutil
import subprocess
import json

# 读取颜色样式
def getAppearance(json):
    if ("appearances" in json):
        for appearance in json["appearances"]:
            return appearance["value"]
    else:
        return "default"

# 格式化
def formatAppearance(content):
    if content == "default":
        return "default"
    elif content == "dark":
        return "dark   "
    elif content == "light":
        return "light  "
    else:
        return content

# 解析颜色信息
def getColorDetail(json):
    components = json["color"]["components"]
    r = components["red"]
    g = components["green"]
    b = components["blue"]
    a = components["alpha"]
    if r.startswith("0x"):
        return "0x" + r.replace("0x", "") + g.replace("0x", "") + b.replace("0x", "")
    else:
        return "r:" + r + " g:" + g + " b:" + b + " a:" + a

# 首字符转小写
def lowerFirst(str):
    return str[0].lower() + str[1:]

# 解析 JSON 文件
def getColor(name, jsonStr):
    result = "/// " + name + "\n"
    data = json.loads(jsonStr)
    colors = data["colors"]
    for color in colors:
        appearance = formatAppearance(getAppearance(color))
        rgb = getColorDetail(color)
        result += ("/// " + appearance + " - " + rgb + "\n")
    result += ("var " + lowerFirst(name) +": UIColor {\n")
    result += ("    return UIColor(named: \"" + name + "\")!\n")
    result += ("}\n")
    return result
    
#########

# 读取文件
def readFile(path):
    f = open(path, 'r')
    content = f.read()
    f.close()
    return content

# 读取 JSON 文件，输出
def dealColorSet(path, name):
    jsonPath = path + "/Contents.json"
    jsonStr = readFile(jsonPath)
    print(getColor(name, jsonStr))

# 遍历文件夹，寻找 .colorset
def searchPath(path):
    for filename in os.listdir(path):
        if filename.endswith(".colorset"):
            colorName = filename.replace(".colorset", "")
            dealColorSet(path + "/" + filename, colorName)
        elif filename.startswith("."):
            continue
        elif os.path.isdir(filename) or filename.endswith(".xcassets"):
            searchPath(path + "/" + filename)


if __name__ =='__main__' :
    print("===================== Start =====================")
    searchPath(os.getcwd())
    print("=====================  End  =====================")
    
