#!/system/bin/sh

# 应用包名和服务信息
APP_PKG="com.lijianqiang12.silent"
BACKGROUND_SVC="$APP_PKG/com.lijianqiang12.silent.component.service.background_service.BackgroundService"
ACCESSIBILITY_SVC="$APP_PKG/com.lijianqiang12.silent.component.service.MyAccessibilityService"
MODULE_DIR=$(dirname "$0")/..

# 检测间隔（秒）
SLEEP_INTERVAL=15

# 获取前台用户ID
get_foreground_user() {
    am get-current-user || echo 0
}

while true; do
    CURRENT_USER=$(get_foreground_user)

    if ! pgrep -f "$APP_PKG" >/dev/null; then
        am start-foreground-service --user $CURRENT_USER -n $BACKGROUND_SVC
        am start-foreground-service --user $CURRENT_USER -a android.accessibilityservice.AccessibilityService -n $ACCESSIBILITY_SVC
        $MODULE_DIR/tools/access-enabler.sh
    fi
    
    sleep $SLEEP_INTERVAL
done