#!/bin/bash
# Credential Selector v0.9
# 2024. 3
# Write by Sean.Lee 
# ------------------------------------
# credential_selector.sh <NUMBER>   ; NUMBER is <1 ... n>
# ------------------------------------

 local i=0
 local o=0
 local USERCHOICE=$1
 local MYCHOICE=$2
 local EKSCSFLAG="0"
 local EKS=$(kubectl config current-context | sed "s/^.*\///g" | sed "s/.ap\-.*$//g" | sed "s/^.*@//g")

 echo  "___사용가능한 AWS 계정____________________________________________________________________________"
 while read line
 do
         set $line
         i=$((i+1))
         echo "$i ----------- $line"
         if [[ "$USERCHOICE" != "" && "$USERCHOICE" == "$i" ]]
         then
                 `echo ${line}`
                 local set A=($(aws eks list-clusters --query 'clusters[]' --output text))
                 local CNT_A=$(echo "$A" | wc -w)
                 if [[ "$CNT_A" == "1" ]]
                 then
                         #echo "$a"
                         EKS=$A
                         EKSCSFLAG="1"
                 elif [[ "$CNT_A" == "0" ]]
                 then
                         EKSCSFLAG="0"
                 else
                         EKSCSFLAG="2"
                         if [[ "$MYCHOICE" != "" ]]
                         then
                                 for v in $A
                                 do
                                         #echo $v
                                         o=$((o+1))
                                         if [[ "$MYCHOICE" == "$o" ]]
                                         then
                                                 EKS=$v
                                                 EKSCSFLAG="1"
                                                 #echo $EKS
                                         fi
                                 done
                         fi
                 fi

         fi

 done < <(cat ~/.aws/credentials | grep -e "^\[" | tr -d "[]" | xargs -I @ echo "export AWS_PROFILE="@)

 echo
 echo -n "[1] 지금 설정된 AWS Profile  : "; echo2 $RED $AWS_PROFILE
 echo -n "[2] 지금 설정된 ARN ID       : "; aws sts get-caller-identity --query='Arn' --output text

 if [[ "$EKSCSFLAG" == "0" ]]
 then
         echo -n "[3] 현재 설정된 EKS Cluster  : "; echo2 $MAGENTA "$EKS"

 elif [[ "$EKSCSFLAG" == "1" ]]
 then
         echo -n "[3] 자동 설정된 EKS Cluster  : "; echo2 $MAGENTA "$EKS"
         aws eks update-kubeconfig --name $EKS > /dev/null
 else
         echo "[3] 사용 가능한 EKS_Cluster  : " #; aws eks list-clusters --query 'clusters[]' --output table
         echo
         o=0
         while read line
         do
                 set $line
                 o=$((o+1))
                 echo2 $MAGENTA "$o ----------- $line"
         done < <(aws eks list-clusters --query 'clusters[]' --output yaml | awk '{print $2}')
         echo
         echo "EKS cluster가 여러개 입니다. $ m l 1 1 처럼 숫자를 추가하거나 $ eksup [클러스터명] 으로 수동 설정하세요"
 fi
 echo -n "[4] 지금 설정된 Kubeconfig   : "; kubectl config get-contexts | grep -e "^*" | awk '{print $2}'
