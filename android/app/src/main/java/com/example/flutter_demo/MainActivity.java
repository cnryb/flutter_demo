package com.example.flutter_demo;

import android.content.Context;
import android.graphics.Color;
import android.view.View;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "samples.cnryb.com/methodChannel").setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        // Note: this method is invoked on the main thread.
                        if (call.method.equals("sayHello")) {
                            try {
                                result.success("hello world");
                            } catch (Exception e) {
                                result.error("UNAVAILABLE", "出错了", null);
                            }
                        } else {
                            result.notImplemented();
                        }
                    }
                });

        SampleViewFactory playerViewFactory = new SampleViewFactory(flutterEngine.getDartExecutor().getBinaryMessenger());//生成视图工厂
        flutterEngine.getPlatformViewsController().getRegistry().registerViewFactory("sampleView", playerViewFactory);//注册视图工厂
    }
}


//视图工厂类
class SampleViewFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;

    //初始化方法
    public SampleViewFactory(BinaryMessenger msger) {
        super(StandardMessageCodec.INSTANCE);
        messenger = msger;
    }

    //创建原生视图封装类，完成关联
    @Override
    public PlatformView create(Context context, int id, Object obj) {
        return new SimpleViewControl(context, id, messenger);
    }
}

//原生视图封装类
class SimpleViewControl implements PlatformView {
    private final View view;//缓存原生视图

    //初始化方法，提前创建好视图
    public SimpleViewControl(Context context, int id, BinaryMessenger messenger) {
        view = new View(context);
        view.setBackgroundColor(Color.rgb(255, 0, 0));
    }

    //返回原生视图
    @Override
    public View getView() {
        return view;
    }

    //原生视图销毁回调
    @Override
    public void dispose() {
    }
}
