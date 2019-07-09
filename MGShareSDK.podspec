Pod::Spec.new do |s|
  s.name             = 'MGShareSDK'
  s.version          = "4.2.6"
  s.summary          = 'ShareSDK is the most comprehensive Social SDK in the world,which share easily with 40+ platforms.'
  s.license          = 'MIT'
  s.author           = { "zfc" => "zhaofucheng@mgzf.com" }

  s.homepage         = 'http://www.mgzf.com'
  s.source           = { :http => 'https://dev.ios.mob.com/files/download/sharesdk/ShareSDK_For_iOS_v4.2.6.zip' }
  s.platform         = :ios
  s.ios.deployment_target = "8.0"
  s.frameworks       = 'JavaScriptCore'
  s.libraries        = 'sqlite3'
  s.default_subspecs = 'ShareSDK'
  s.dependency 'MOBFoundation'

  # 核心模块
    s.subspec 'ShareSDK' do |sp|
        sp.vendored_frameworks = 'ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework'
        sp.resources = 'ShareSDK/Support/Required/ShareSDK.bundle'
    end

    # 各个平台：每个平台都必须要有ShareSDK.bundle和对应的Connector
    s.subspec 'ShareSDKPlatforms' do |sp|

        # QQ
        sp.subspec 'QQ' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/QQSDK/TencentOpenAPI.framework','ShareSDK/Support/PlatformConnector/QQConnector.framework'
            ssp.libraries = 'sqlite3'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # SinaWeibo
        sp.subspec 'SinaWeibo' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.a"
            ssp.resources = 'ShareSDK/Support/PlatformSDK/SinaWeiboSDK/WeiboSDK.bundle'
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SinaWeiboConnector.framework'
            ssp.frameworks = 'ImageIO'
            ssp.libraries = 'sqlite3'
            ssp.source_files = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.{h,m}"
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.h"
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # WeChat
        sp.subspec 'WeChat' do |ssp|
            # ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.a"
            # ssp.source_files = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.{h,m}"
            ssp.vendored_frameworks = './MGWechatFullSdk.framework'
            # ssp.public_header_files = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.h"
            ssp.libraries = 'sqlite3'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # WeChatFull
        sp.subspec 'WeChatFull' do |ssp|
            # ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/WeChatSDKFull/*.a"
            # ssp.source_files = "ShareSDK/Support/PlatformSDK/WeChatSDKFull/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WechatConnector.framework'
            # ssp.public_header_files = "ShareSDK/Support/PlatformSDK/WeChatSDKFull/*.h"
            ssp.libraries = 'sqlite3'
            ssp.dependency 'MGShareSDK/ShareSDK'
            ssp.dependency 'MGPayFridge'
        end

        # RenRen
        sp.subspec 'RenRen' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.framework' ,'ShareSDK/Support/PlatformConnector/RenrenConnector.framework'
            ssp.resource = 'ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.bundle'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # 支付宝（AliSocial）
        sp.subspec 'AliPaySocial' do |ssp|
            ssp.vendored_libraries = 'ShareSDK/Support/PlatformSDK/APSocialSDK/*.a'
            ssp.source_files = "ShareSDK/Support/PlatformSDK/APSocialSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/AliSocialConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/APSocialSDK/*.h"
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Kakao
        sp.subspec 'Kakao' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoOpenSDK.framework','ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoCommon.framework','ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoLink.framework','ShareSDK/Support/PlatformConnector/KakaoConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # MeiPai
        sp.subspec 'MeiPai' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/MPShareSDK/MPShareSDK.framework','ShareSDK/Support/PlatformConnector/MeiPaiConnector.framework'
            ssp.frameworks = 'AssetsLibrary'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Yixin
        sp.subspec 'Yixin' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/EasyChatConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.h"
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Facebook
        sp.subspec 'Facebook' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/FacebookConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Messenger
        sp.subspec 'Messenger' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/FacebookMessengerConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Copy
        sp.subspec 'Copy' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/CopyConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Evernote
        sp.subspec 'Evernote' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/EvernoteConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # GooglePlus
        sp.subspec 'GooglePlus' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/GooglePlusConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Instagram
        sp.subspec 'Instagram' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/InstagramConnector.framework'
            ssp.frameworks = 'AssetsLibrary','Photos'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Instapaper
        sp.subspec 'Instapaper' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/InstapaperConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Line
        sp.subspec 'Line' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/LineSDK/LineSDK.framework','ShareSDK/Support/PlatformConnector/LineConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Mail
        sp.subspec 'Mail' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/MailConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # SMS
        sp.subspec 'SMS' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SMSConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # WhatsApp
        sp.subspec 'WhatsApp' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WhatsAppConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # YouTube
        sp.subspec 'YouTube' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/YouTubeConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Twitter
        sp.subspec 'Twitter' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/TwitterConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Dropbox
        sp.subspec 'Dropbox' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/DropboxConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # DingTalk
        sp.subspec 'DingTalk' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/DingTalkSDK/DTShareKit.framework','ShareSDK/Support/PlatformConnector/DingTalkConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # CMCC
        sp.subspec 'CMCC' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/CMCCSDK/TYRZSDK.framework','ShareSDK/Support/PlatformConnector/CMCCConnector.framework'
            ssp.resources = 'ShareSDK/Support/PlatformSDK/CMCCSDK/Resource.bundle'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Telegram
            sp.subspec 'Telegram' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/TelegramConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Reddit
        sp.subspec 'Reddit' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/RedditConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # DouBan
        sp.subspec 'DouBan' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/DouBanConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Flickr
        sp.subspec 'Flickr' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/FlickrConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # KaiXin
        sp.subspec 'KaiXin' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/KaiXinConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # LinkedIn
        sp.subspec 'LinkedIn' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/LinkedInConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # MingDao
        sp.subspec 'MingDao' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/MingDaoConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Pinterest
        sp.subspec 'Pinterest' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/PinterestConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Pocket
        sp.subspec 'Pocket' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/PocketConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Print
        sp.subspec 'Print' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/PrintConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # TencentWeibo
        sp.subspec 'TencentWeibo' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/TencentWeiboConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Tumblr
        sp.subspec 'Tumblr' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/TumblrConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # VKontakte
        sp.subspec 'VKontakte' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/VKontakteConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # YouDaoNote
        sp.subspec 'YouDaoNote' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/YouDaoNoteConnector.framework'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # ESurfing(天翼)
        sp.subspec 'ESurfing' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/ESurfingSDK/EAccountSDKArchive.framework','ShareSDK/Support/PlatformConnector/ESurfingConnector.framework'
            ssp.resources = 'ShareSDK/Support/PlatformSDK/ESurfingSDK/HTMLResource.bundle'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # FacebookAccount
        sp.subspec 'FacebookAccount' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/FacebookAccountSDK/AccountKit.framework','ShareSDK/Support/PlatformConnector/FacebookAccountConnector.framework'
            ssp.resources = 'ShareSDK/Support/PlatformSDK/FacebookAccountSDK/AccountKitStrings.bundle'
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

        # Douyin(抖音)
        sp.subspec 'Douyin' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/DouyinOpenSDK/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/DouyinOpenSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/DouyinConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/DouyinOpenSDK/*.h"
            ssp.dependency 'MGShareSDK/ShareSDK'
        end

    end

    # ShareSDK 配置文件模块
    s.subspec 'ShareSDKConfigFile' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKConfigFile.framework'
        sp.resources = 'ShareSDK/Support/Optional/ShareSDKConfigFile.bundle'
        sp.dependency 'MGShareSDK/ShareSDK'
    end
    
    # ShareSDK Extension扩展模块
    s.subspec 'ShareSDKExtension' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKExtension.framework'
        sp.dependency 'MGShareSDK/ShareSDK'
    end

    # ShareSDK提供的UI
    s.subspec 'ShareSDKUI' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKUI.framework'
        sp.resources = 'ShareSDK/Support/Optional/ShareSDKUI.bundle'
        sp.dependency 'MGShareSDK/ShareSDK'
    end
end
