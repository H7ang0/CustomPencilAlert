<h1 align="center">iOS CustomPencilAlert</h1>

<p align="center">
  <img src="preview.jpg" width="300" alt="Preview">
</p>

<p align="center">
  <a href="https://t.me/HyanguChat">
    <img src="https://img.shields.io/badge/Telegram-HyanguChat-blue.svg?logo=telegram" alt="Telegram">
  </a>
  <img src="https://img.shields.io/badge/Platform-iOS%2014.0%2B-lightgrey" alt="Platform">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License">
</p>

<p align="center">
  一个优雅的 iOS Toast 通知插件，完美还原 Apple 原生通知样式，支持自定义文本内容
</p>

## ✨ 功能特点

- 🎨 完美还原 Apple 原生通知样式
- 🌟 优雅的圆角设计
- 🎭 半透明磨砂玻璃效果
- ⚡️ 流畅的显示/消失动画
- 📱 支持 iOS 14.0+
- 🔧 易于集成和自定义

## 📂 项目结构

* 📱 Tweak.x                  主要实现代码
* 🔧 Makefile                 编译配置
* 📋 control                  插件信息
* ⚙️ CustomPencilAlert.plist  注入配置


## 🚀 使用方法

### 编译安装

1. 确保已安装 [Theos](https://theos.dev/)
2. 克隆项目并编译：
```bash
git clone https://github.com/H7ang0/CustomPencilAlert.git
cd CustomPencilAlert
make package
```

3. 安装生成的 deb 文件
4. 重启设备使插件生效

### 💡 自定义使用

修改 `CustomPencilAlert.plist` 指定注入目标：

<key>Bundles</key>
<array>
<string>目标应用的Bundle ID</string>
</array>
## 📝 代码示例
```objc
// 显示 Toast
[CustomToastView showToast:@"你的消息"];
// 自定义配置
CGFloat width = 200; // 修改宽度
CGFloat height = 50; // 修改高度
```

## ⚠️ 注意事项

- 需要正确设置目标应用的 Bundle ID
- 确保设备已越狱
- iOS 14.0 或更高版本

## 📱 兼容性

- 支持 iOS 14.0 及以上系统
- 支持 arm64/arm64e 架构
- 需要设备已越狱

## 💬 Telegram

- 作者：Hyangu
- Telegram：[@HyanguChat](https://t.me/HyanguChat)

## 📄 许可证

本项目采用 [MIT](LICENSE) 许可证开源。

## 📋 更新日志

### [1.0.0] - 2024-01
- ✨ 首次发布
- 🎨 实现基础 Toast 功能
- 🌟 添加磨砂玻璃效果
- ⚡️ 优化动画表现

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 🙏 致谢

- [Apple](https://www.apple.com) - 设计灵感
- [Theos](https://theos.dev/) - 越狱开发工具链
