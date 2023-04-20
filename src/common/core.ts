export enum DefaultRoleIndex {
  admin = 1,
  tempUser,
}

export enum DefaultDepartmentIndex {
  root = 1,
  tempDepartment,
}

export enum DefaultUserIndex {
  admin = 1,
  deletedAccount = 2,
}

export enum EntityTypeIndex {
  person = 1,
  company,
}

export enum CompanyTypeIndex {
  self = 1,
  agency,
  developer,
  partner,
}

export enum ContactTypeIndex {
  email = 1,
  phone,
  session,
}

export enum LeadStatusIndex {
  new = 1,
  noAnswer,
  contacted,
  optionsSent,
  warm,
  hot,
  customer,
  archive,
  junk,
  unsuccessful,
}

export enum PropertyTypeIndex {
  apartment = 1,
  villa,
  townhouse,
  bungalow,
  building,
  floor,
  office,
  land,
}

export enum PropertyRoomIndex {
  studio = 1,
  one,
  two,
  three,
  four,
  five,
  six,
  sevenPlus,
}

export enum DealStatusIndex {
  draft = 1,
  inProgress,
  approved,
  spaSigned,
  commissionCleared,
  dealLost,
}

export enum DealTypeIndex {
  offplanSales = 1,
  secondarySales,
  resaleSales,
  rentalLeasing,
  renewalLeasing,
}

export enum ActivityTypeIndex {
  update = 1,
  system,
  comment,
  call,
  email,
  message,
  event,
}

export enum CallStateIndex {
  active = 1,
  incoming,
  outgoing,
  missed,
  noAnswer,
  declined,
}

export enum CallTypeIndex {
  system = 1,
  phone,
  whatsApp,
  telegram,
}

export enum ChatTypeIndex {
  system = 1,
  sms,
  webChat,
  telegram,
  whatsApp,
  telegramGroup,
  whatsAppGroup,
}

export enum ChatPermission {
  sendTextMessage = 'sendTextMessage',
  sendMedia = 'sendMedia',
  sendDocument = 'sendDocument',
  sendVoice = 'sendVoice',
  sendLocation = 'sendLocation',
  sendContact = 'sendContact',
}

export enum LeadIntentionIndex {
  buy = 1,
  sell,
  rent,
  rentOut,
}

export enum LeadSourceIndex {
  personal = 1,
  referral,
  companyReferral,
  web,
  socialMedia,
  promotions,
  teleSales,
  thirdParty,
  company,
}

export enum DepartmentTagIndex {
  offplan = 1,
  secondary,
}

export enum AdSourceIndex {
  adWords = 1,
  yandex,
  facebook,
  instagram,
  tiktok,
  linkedin,
  twitter,
  bingAds,
  youTube,
  emailNewsletter,
  sms,
  bayut,
  propertyFinder,
  dubizzle,
  prian,
  tranio,
  homesOverSeas,
  emiratesEstate,
  emaarStand,
  portal,
}

export enum ChannelSourceIndex {
  call = 1,
  form,
  webChat,
  whatsAppMessage,
  whatsAppCall,
  telegramMessage,
  email,
  facebookMessage,
  instagramMessage,
  jivoChat,
}

export enum EventTypeIndex {
  followUp = 1,
  meeting,
}

export enum EventAlertTypeIndex {
  atEventTime = 1,
  minuteBefore5,
  minuteBefore10,
  minuteBefore15,
  minuteBefore30,
  hourBefore1,
  hourBefore2,
  dayBefore1,
  dayBefore2,
  weekBefore1,
}

export enum FollowUpTypeIndex {
  call = 1,
  message,
  wait,
}

export enum SearchPeriodIndex {
  tomorrow = 1,
  today,
  yesterday,
  week,
  lastWeek,
  month,
  lastMonth,
  last2Months,
  last3Months,
  last6Months,
  year,
}

export enum TagCategoryType {
  SYSTEM = 'SYSTEM',
  AD_TAGS = 'AD_TAGS',
  CUSTOM = 'CUSTOM',
}
