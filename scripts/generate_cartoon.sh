#!/bin/bash
# AI漫剧快速生成脚本
# 用法: ./generate_cartoon.sh "主题" "类型" "时长"

set -e

THEME="${1:-}"
TYPE="${2:-搞笑}"
DURATION="${3:-90}"

if [ -z "$THEME" ]; then
    echo "用法: $0 <主题> [类型] [时长秒数]"
    echo "示例: $0 \"校园恋爱\" \"甜宠\" 90"
    exit 1
fi

echo "========================================="
echo "  AI漫剧生成器"
echo "========================================="
echo "主题: $THEME"
echo "类型: $TYPE"
echo "时长: ${DURATION}秒"
echo "========================================="

# 创建输出目录
OUTPUT_DIR="/home/xiaofang/workspace/cartoon/output/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

# 输出剧本文件
SCRIPT_FILE="$OUTPUT_DIR/剧本.md"
STORYBOARD_FILE="$OUTPUT_DIR/分镜.md"
CHAR_FILE="$OUTPUT_DIR/角色卡.md"

echo "正在生成剧本..."
cat > "$SCRIPT_FILE" << 'SCRIPT_TEMPLATE'
# 《待定标题》AI漫剧剧本

## 基本信息
- **集数**：第一集
- **时长**：90秒
- **类型**：TYPE_PLACEHOLDER
- **受众**：青少年/全年龄

## 一句话故事

> 故事核心一句话

## 角色设定

| 角色 | 性别 | 年龄 | 性格标签 |
|------|------|------|----------|
| | | | |

## 详细剧本

### 【开场】
...

### 【发展】
...

### 【高潮】
...

### 【结尾】
...

## 关键台词
SCRIPT_TEMPLATE

# 替换类型占位符
sed -i "s/TYPE_PLACEHOLDER/$TYPE/" "$SCRIPT_FILE"

echo "剧本已保存: $SCRIPT_FILE"

echo "正在生成分镜..."
cat > "$STORYBOARD_FILE" << 'STORYBOARD_TEMPLATE'
# 分镜脚本

## 分镜表格式

| # | 时长 | 画面描述 | 镜头 | 对白/旁白 |
|---|------|----------|------|-----------|
| 01 | 5秒 | | 远景 | |
| 02 | 8秒 | | 中景 | |

## AI视频提示词示例

请根据上方剧本内容，为每个分镜生成对应的AI视频生成提示词。
STORYBOARD_TEMPLATE

echo "分镜已保存: $STORYBOARD_FILE"

echo "正在生成角色卡..."
cat > "$CHAR_FILE" << 'CHAR_TEMPLATE'
# 角色卡

## 角色基本信息

| 字段 | 内容 |
|------|------|
| 角色名 | |
| 性别 | |
| 年龄 | |
| 职业/身份 | |

## 外观特征

| 字段 | 描述 |
|------|------|
| 发型 | |
| 发色 | |
| 瞳色 | |
| 身高 | |
| 穿衣风格 | |

## 性格标签

- [ ] 乐观开朗
- [ ] 内向害羞
- [ ] 傲娇
- [ ] 幽默搞笑

## AI绘图提示词

```
anime style, character design,
detailed face, clean lineart
```
CHAR_TEMPLATE

echo "角色卡已保存: $CHAR_FILE"

echo ""
echo "========================================="
echo "  生成完成！"
echo "========================================="
echo "输出目录: $OUTPUT_DIR"
echo ""
echo "生成的文件:"
ls -la "$OUTPUT_DIR"
echo ""
echo "下一步:"
echo "1. 编辑剧本文件，填充具体内容"
echo "2. 使用分镜文件生成AI视频提示词"
echo "3. 将提示词输入到 DomoAI/可灵AI 等工具生成视频"
