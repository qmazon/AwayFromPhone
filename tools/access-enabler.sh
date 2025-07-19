#!/system/bin/sh

APP_PKG="com.lijianqiang12.silent"
SERVICE_COMPONENT="$APP_PKG/com.lijianqiang12.silent.component.service.MyAccessibilityService"

# 获取当前启用的服务
ENABLED_SERVICES=$(settings get secure enabled_accessibility_services)

# 检查是否已包含目标服务
case "$ENABLED_SERVICES" in
    *$SERVICE_COMPONENT*) 
        exit 0 # 已启用
        ;;
esac

# 添加新服务
if [ -z "$ENABLED_SERVICES" ]; then
    NEW_SERVICES=$SERVICE_COMPONENT
else
    NEW_SERVICES="$ENABLED_SERVICES:$SERVICE_COMPONENT"
fi

# 更新系统设置
settings put secure enabled_accessibility_services "$NEW_SERVICES"
settings put secure accessibility_enabled 1