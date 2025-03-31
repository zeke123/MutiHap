import { common } from '@kit.AbilityKit';
import Logger from '../util/Logger'
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = 'Index'
const BUNDLE_NAME: string = 'com.example.mutihap'
const A_FEATURE_ABILITY_NAME: string = "A_FeatureAbility"
const B_FEATURE_ABILITY_NAME: string = "B_FeatureAbility"

@Entry
@Component
struct Index {
  private context?: common.UIAbilityContext

  build() {
    Row() {
      Column() {
        Button(A_FEATURE_ABILITY_NAME)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            if (this.context) {
              this.context.startAbility({
                bundleName: BUNDLE_NAME,
                abilityName: A_FEATURE_ABILITY_NAME
              }).then(() => {
                Logger.info(TAG, 'start A_FeatureAbility ability success')
              }).catch((error: BusinessError) => {
                Logger.error(TAG, 'start audio ability failed, error: ' + JSON.stringify(error))
              })
            }
          })
          .id('btnA')
          .margin({ bottom: 20 })
        Button(B_FEATURE_ABILITY_NAME)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            if (this.context) {
              this.context.startAbility({
                bundleName: BUNDLE_NAME,
                abilityName: B_FEATURE_ABILITY_NAME
              }).then(() => {
                Logger.info(TAG, 'start video ability success')
              }).catch((error: BusinessError) => {
                Logger.error(TAG, 'start video ability failed, error: ' + JSON.stringify(error))
              })
            }
          })
          .id('btnB')
      }
      .width('100%')
    }
    .height('100%')
  }

  aboutToAppear() {
    this.context = getContext(this) as common.UIAbilityContext
  }
}