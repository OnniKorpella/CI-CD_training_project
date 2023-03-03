#!/bin/bash

TEXT="$1: $CI_JOB_STAGE%0A%0AStatus: $CI_JOB_STATUS%0A%0AProject:+$CI_PROJECT_NAME%0A"

curl -s --max-time 8 -d "chat_id=442002799&disable_web_page_preview=1&text=$TEXT" https://api.telegram.org/bot5688993492:AAFxus1DXRc_DmjELOMt_Y_j0sDuUBiL4dQ/sendMessage > /dev/null

5688993492:AAFxus1DXRc_DmjELOMt_Y_j0sDuUBiL4dQ
442002799
# https://api.telegram.org/bot5688993492:AAFxus1DXRc_DmjELOMt_Y_j0sDuUBiL4dQ/sendMessage?chat_id=442002799&text=привет!