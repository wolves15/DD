from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.core.window import Window
from kivy.utils import platform
import webbrowser

class WebViewApp(App):
    def build(self):
        # 设置窗口标题
        self.title = 'WebView App'
        
        # 创建主布局
        layout = BoxLayout(orientation='vertical', padding=10, spacing=10)
        
        # 添加标签
        label = Label(
            text='正在打开 https://5rb5va315595.vicp.fun/...',
            font_size=20,
            size_hint_y=0.1
        )
        layout.add_widget(label)
        
        # 添加按钮
        button = Button(
            text='打开网站',
            font_size=18,
            size_hint_y=0.1
        )
        button.bind(on_press=self.open_website)
        layout.add_widget(button)
        
        # 添加说明标签
        info_label = Label(
            text='点击按钮或等待自动跳转',
            font_size=14,
            size_hint_y=0.8
        )
        layout.add_widget(info_label)
        
        # 自动打开网站
        self.open_website(None)
        
        return layout
    
    def open_website(self, instance):
        url = 'https://5rb5va315595.vicp.fun/'
        
        if platform == 'android':
            # 在Android上使用浏览器打开
            from jnius import autoclass
            PythonActivity = autoclass('org.kivy.android.PythonActivity')
            Intent = autoclass('android.content.Intent')
            Uri = autoclass('android.net.Uri')
            
            intent = Intent()
            intent.setAction(Intent.ACTION_VIEW)
            intent.setData(Uri.parse(url))
            PythonActivity.mActivity.startActivity(intent)
        else:
            # 在其他平台上使用默认浏览器
            webbrowser.open(url)

if __name__ == '__main__':
    WebViewApp().run()