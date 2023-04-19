-- CreateEnum
CREATE TYPE "MessageType" AS ENUM ('service', 'text', 'photo', 'audio', 'video', 'voice', 'document', 'contact', 'location', 'animation', 'sticker');

-- CreateEnum
CREATE TYPE "ChatCategory" AS ENUM ('private', 'group', 'channel');

-- CreateEnum
CREATE TYPE "PersonAttachmentType" AS ENUM ('PASSPORT', 'OTHER');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('ONLINE', 'OFFLINE', 'DEACTIVATED', 'FORCE_OFFLINE', 'OVERDUE', 'MEETING');

-- CreateEnum
CREATE TYPE "ItemType" AS ENUM ('furniture', 'property', 'car');

-- CreateEnum
CREATE TYPE "PermissionType" AS ENUM ('TABLE', 'INTERFACE', 'BUSINESS_PROCESS');

-- CreateEnum
CREATE TYPE "BusinessProcessEntity" AS ENUM ('LEAD', 'DEAL', 'USER', 'CHAT', 'POOL', 'DEPARTMENT', 'WEBHOOK', 'OTHER');

-- CreateEnum
CREATE TYPE "TagCategoryType" AS ENUM ('SYSTEM', 'AD_TAGS', 'CUSTOM');

-- CreateEnum
CREATE TYPE "TagType" AS ENUM ('COUNTRY', 'CITY', 'NATIONALITY', 'LANGUAGE', 'AD_SOURCE', 'CHANNEL_SOURCE', 'WEB_SOURCE', 'COMMUNITY', 'PROJECT', 'AD_TAG', 'DEPARTMENT', 'LEAD_INTENTION', 'LEAD_SOURCE', 'PROPERTY_TYPE', 'PROPERTY_ROOM', 'PROPERTY_AREA_SIZE', 'CUSTOM');

-- CreateTable
CREATE TABLE "ActivityType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ActivityType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Activity" (
    "id" SERIAL NOT NULL,
    "typeId" INTEGER NOT NULL,
    "initiatorId" INTEGER,
    "recipientId" INTEGER,
    "leadId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "customFieldsValue" JSONB NOT NULL DEFAULT '{}',

    CONSTRAINT "Activity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SystemActivity" (
    "activityId" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "SystemActivity_pkey" PRIMARY KEY ("activityId")
);

-- CreateTable
CREATE TABLE "Update" (
    "activityId" INTEGER NOT NULL,
    "model" TEXT NOT NULL,
    "field" TEXT NOT NULL,
    "before" TEXT,
    "after" TEXT,
    "beforeIds" INTEGER[],
    "afterIds" INTEGER[],
    "isPrimitive" BOOLEAN NOT NULL,

    CONSTRAINT "Update_pkey" PRIMARY KEY ("activityId")
);

-- CreateTable
CREATE TABLE "Comment" (
    "activityId" INTEGER NOT NULL,
    "text" TEXT NOT NULL,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("activityId")
);

-- CreateTable
CREATE TABLE "File" (
    "id" SERIAL NOT NULL,
    "hash" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "mimeType" TEXT NOT NULL,
    "path" TEXT NOT NULL,
    "thumbnail" TEXT,
    "resolution" TEXT,
    "caption" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "File_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Animal" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "fileName" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Animal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Color" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "main" TEXT NOT NULL,
    "secondary" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Color_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SystemPhone" (
    "id" SERIAL NOT NULL,
    "phone" TEXT NOT NULL,
    "secondaryPhone" TEXT NOT NULL,
    "telegramId" TEXT,
    "reservedUntil" TIMESTAMP(3),
    "reservedForLeadId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SystemPhone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MobileAppFile" (
    "id" SERIAL NOT NULL,
    "version" TEXT NOT NULL,
    "fileId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MobileAppFile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CallType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "icon" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CallType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CallState" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CallState_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Call" (
    "activityId" INTEGER NOT NULL,
    "recordingFileId" INTEGER,
    "callTypeId" INTEGER NOT NULL,
    "systemPhoneId" INTEGER,
    "initiatedPhone" TEXT,
    "recipientPhone" TEXT,
    "startedAt" TIMESTAMP(3),
    "endedAt" TIMESTAMP(3),
    "declined" BOOLEAN NOT NULL,
    "platformId" TEXT,

    CONSTRAINT "Call_pkey" PRIMARY KEY ("activityId")
);

-- CreateTable
CREATE TABLE "Message" (
    "activityId" INTEGER NOT NULL,
    "type" "MessageType" NOT NULL,
    "platformId" TEXT,
    "mediaId" INTEGER,
    "chatId" INTEGER NOT NULL,
    "text" TEXT,
    "formattedText" TEXT,
    "actions" JSONB,
    "score" INTEGER,
    "contacts" TEXT[],
    "location" JSONB,
    "replyId" INTEGER,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("activityId")
);

-- CreateTable
CREATE TABLE "ChatPermission" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "ChatPermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChatType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "icon" TEXT NOT NULL,
    "backgroundColor" TEXT NOT NULL,
    "category" "ChatCategory" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ChatType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChatParticipants" (
    "chatId" INTEGER NOT NULL,
    "entityId" INTEGER NOT NULL,
    "contactId" INTEGER,
    "blocked" BOOLEAN NOT NULL,

    CONSTRAINT "ChatParticipants_pkey" PRIMARY KEY ("chatId","entityId")
);

-- CreateTable
CREATE TABLE "Chat" (
    "id" SERIAL NOT NULL,
    "platformId" TEXT,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "deactivated" BOOLEAN NOT NULL DEFAULT false,
    "typeId" INTEGER NOT NULL,
    "leadId" INTEGER,
    "title" TEXT,
    "photoId" INTEGER,
    "lastMessageId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Chat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PoolOnUser" (
    "poolId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "seen" BOOLEAN NOT NULL,
    "selected" BOOLEAN NOT NULL,
    "requested" BOOLEAN NOT NULL,

    CONSTRAINT "PoolOnUser_pkey" PRIMARY KEY ("poolId","userId")
);

-- CreateTable
CREATE TABLE "Pool" (
    "id" SERIAL NOT NULL,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "converted" BOOLEAN NOT NULL DEFAULT false,
    "closeTime" TIMESTAMP(3),
    "chatId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pool_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ContactType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ContactType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contact" (
    "id" SERIAL NOT NULL,
    "deleted" BOOLEAN NOT NULL DEFAULT false,
    "typeId" INTEGER NOT NULL,
    "createdById" INTEGER,
    "ownerId" INTEGER NOT NULL,
    "leadId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "customFieldsValue" JSONB NOT NULL DEFAULT '{}',

    CONSTRAINT "Contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PhoneContact" (
    "contactId" INTEGER NOT NULL,
    "color" TEXT NOT NULL,
    "phone" TEXT,
    "telegramId" TEXT,
    "telegramUsername" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PhoneContact_pkey" PRIMARY KEY ("contactId")
);

-- CreateTable
CREATE TABLE "EmailContact" (
    "contactId" INTEGER NOT NULL,
    "color" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmailContact_pkey" PRIMARY KEY ("contactId")
);

-- CreateTable
CREATE TABLE "SessionContact" (
    "contactId" INTEGER NOT NULL,
    "cookie" TEXT,
    "sessionId" TEXT NOT NULL,
    "webhookId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SessionContact_pkey" PRIMARY KEY ("contactId")
);

-- CreateTable
CREATE TABLE "CustomTable" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "schema" JSONB NOT NULL,
    "searchableFields" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomTable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomTableValue" (
    "id" SERIAL NOT NULL,
    "values" JSONB NOT NULL,
    "tableId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomTableValue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Deal" (
    "id" SERIAL NOT NULL,
    "itemType" "ItemType" NOT NULL,
    "itemId" INTEGER NOT NULL,
    "statusId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,
    "amount" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Deal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DealStatus" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "step" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DealStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DealType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "itemType" "ItemType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DealType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmailThread" (
    "id" SERIAL NOT NULL,
    "threadId" TEXT NOT NULL,
    "subject" TEXT NOT NULL,
    "ownerId" INTEGER NOT NULL,
    "lastEmailId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmailThread_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmailDraft" (
    "id" SERIAL NOT NULL,
    "to" TEXT[],
    "cc" TEXT[],
    "bcc" TEXT[],
    "subject" TEXT,
    "body" TEXT,
    "replyTo" TEXT,
    "threadId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "EmailDraft_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Email" (
    "activityId" INTEGER NOT NULL,
    "messageId" TEXT NOT NULL,
    "replyTo" TEXT,
    "mailBox" TEXT[],
    "from" TEXT NOT NULL,
    "to" TEXT[],
    "cc" TEXT[],
    "bcc" TEXT[],
    "emailTo" TEXT[],
    "subject" TEXT NOT NULL,
    "text" TEXT,
    "html" TEXT,
    "threadId" INTEGER NOT NULL,

    CONSTRAINT "Email_pkey" PRIMARY KEY ("activityId")
);

-- CreateTable
CREATE TABLE "EntityType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EntityType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Entity" (
    "id" SERIAL NOT NULL,
    "verified" BOOLEAN NOT NULL,
    "colorId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,
    "connectionId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Entity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PersonAttachment" (
    "personId" INTEGER NOT NULL,
    "attachmentId" INTEGER NOT NULL,
    "type" "PersonAttachmentType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PersonAttachment_pkey" PRIMARY KEY ("personId","attachmentId")
);

-- CreateTable
CREATE TABLE "Person" (
    "entityId" INTEGER NOT NULL,
    "displayName" TEXT NOT NULL,
    "firstName" TEXT,
    "secondName" TEXT,
    "lastName" TEXT,
    "birthDate" TIMESTAMP(3),
    "activeCallId" INTEGER,
    "avatarId" INTEGER NOT NULL,
    "customFieldsValue" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Person_pkey" PRIMARY KEY ("entityId")
);

-- CreateTable
CREATE TABLE "CompanyType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CompanyType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Company" (
    "entityId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "customFieldsValue" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Company_pkey" PRIMARY KEY ("entityId")
);

-- CreateTable
CREATE TABLE "User" (
    "personId" INTEGER NOT NULL,
    "status" "UserStatus"[] DEFAULT ARRAY['OFFLINE']::"UserStatus"[],
    "needsPasswordChange" BOOLEAN NOT NULL DEFAULT false,
    "password" TEXT NOT NULL,
    "dailyQuota" INTEGER NOT NULL DEFAULT 10,
    "monthlyQuota" INTEGER NOT NULL DEFAULT 100,
    "afterDealQuota" INTEGER NOT NULL DEFAULT 300,
    "remainedDailyQuota" INTEGER NOT NULL DEFAULT 10,
    "remainedMonthlyQuota" INTEGER NOT NULL DEFAULT 100,
    "remainedAfterDealQuota" INTEGER NOT NULL DEFAULT 300,
    "customFieldsValue" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("personId")
);

-- CreateTable
CREATE TABLE "UserSession" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "client" TEXT NOT NULL,
    "ip" TEXT NOT NULL,
    "meta" JSONB DEFAULT '{}',
    "loggedOutAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UserSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserLocation" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "altitude" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UserLocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EventAlertType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EventAlertType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EventType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EventType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FollowUpType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FollowUpType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FollowUpEvent" (
    "eventId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,
    "allDay" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "FollowUpEvent_pkey" PRIMARY KEY ("eventId")
);

-- CreateTable
CREATE TABLE "MeetingEvent" (
    "eventId" INTEGER NOT NULL,
    "showAsBusy" BOOLEAN NOT NULL DEFAULT true,
    "address" TEXT NOT NULL,
    "latitude" DOUBLE PRECISION,
    "longitude" DOUBLE PRECISION,

    CONSTRAINT "MeetingEvent_pkey" PRIMARY KEY ("eventId")
);

-- CreateTable
CREATE TABLE "EventInvites" (
    "eventId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "accepted" BOOLEAN NOT NULL,
    "rejected" BOOLEAN NOT NULL,

    CONSTRAINT "EventInvites_pkey" PRIMARY KEY ("eventId","userId")
);

-- CreateTable
CREATE TABLE "Event" (
    "activityId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "notes" TEXT,
    "eventDate" TIMESTAMP(3) NOT NULL,
    "eventEndDate" TIMESTAMP(3),
    "isArchived" BOOLEAN NOT NULL DEFAULT false,
    "alertId" INTEGER,
    "invitedEmails" TEXT[],

    CONSTRAINT "Event_pkey" PRIMARY KEY ("activityId")
);

-- CreateTable
CREATE TABLE "Item" (
    "id" SERIAL NOT NULL,
    "type" "ItemType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Property" (
    "itemId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,
    "projectId" INTEGER NOT NULL,
    "unitId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "bedrooms" INTEGER NOT NULL,
    "bathrooms" INTEGER,
    "areaSize" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Property_pkey" PRIMARY KEY ("itemId")
);

-- CreateTable
CREATE TABLE "Lead" (
    "id" SERIAL NOT NULL,
    "seen" BOOLEAN NOT NULL DEFAULT false,
    "isPotential" BOOLEAN NOT NULL DEFAULT false,
    "quality" INTEGER NOT NULL DEFAULT 0,
    "itemType" "ItemType" NOT NULL,
    "budget" DOUBLE PRECISION,
    "sourceDetails" TEXT,
    "contactedSystemPhoneId" INTEGER,
    "responsibleAgentId" INTEGER,
    "personId" INTEGER NOT NULL,
    "statusId" INTEGER NOT NULL,
    "lastFollowUpId" INTEGER,
    "customFieldsValue" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Lead_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeadStatus" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "backgroundColor" TEXT NOT NULL,
    "step" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LeadStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SearchPeriod" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SearchPeriod_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeadSearchPreset" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "isSystem" BOOLEAN NOT NULL,
    "seenLeads" BOOLEAN,
    "dateRangeForEvents" BOOLEAN DEFAULT false,
    "ascending" BOOLEAN DEFAULT false,
    "ownerId" INTEGER,
    "responsibleAgentId" INTEGER,
    "periodId" INTEGER,
    "from" TIMESTAMP(3),
    "to" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LeadSearchPreset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Department" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "headId" INTEGER,
    "parentId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DepartmentToUser" (
    "departmentId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "roleId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DepartmentToUser_pkey" PRIMARY KEY ("departmentId","userId")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RoleToUser" (
    "roleId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RoleToUser_pkey" PRIMARY KEY ("roleId","userId")
);

-- CreateTable
CREATE TABLE "Permission" (
    "id" SERIAL NOT NULL,
    "roleId" INTEGER NOT NULL,
    "type" "PermissionType" NOT NULL,
    "subject" TEXT,
    "properties" JSONB,
    "businessProcessId" INTEGER,
    "businessProcessValue" BOOLEAN DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BusinessProcess" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "entity" "BusinessProcessEntity" NOT NULL,
    "code" TEXT NOT NULL,
    "schema" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BusinessProcess_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TagCategory" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "type" "TagCategoryType" NOT NULL,
    "combineGroups" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TagCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tag" (
    "id" SERIAL NOT NULL,
    "conditional" BOOLEAN NOT NULL,
    "type" "TagType" NOT NULL,
    "categoryId" INTEGER,
    "countryId" INTEGER,
    "cityId" INTEGER,
    "nationalityId" INTEGER,
    "languageId" INTEGER,
    "adSourceId" INTEGER,
    "channelSourceId" INTEGER,
    "webSourceId" INTEGER,
    "communityId" INTEGER,
    "projectId" INTEGER,
    "adTagId" INTEGER,
    "departmentTagId" INTEGER,
    "leadIntentionId" INTEGER,
    "leadSourceId" INTEGER,
    "propertyTypeId" INTEGER,
    "propertyRoomId" INTEGER,
    "propertyAreaSizeId" INTEGER,
    "customTagId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomTag" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "value" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdTag" (
    "id" SERIAL NOT NULL,
    "key" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "field" TEXT,
    "countryId" INTEGER NOT NULL,
    "adSourceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AdTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DepartmentTag" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DepartmentTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "phoneCode" TEXT NOT NULL,
    "emoji" TEXT NOT NULL,
    "shortCode1" TEXT NOT NULL,
    "shortCode2" TEXT NOT NULL,
    "adWordsCode" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "City" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "timezone" TEXT NOT NULL,
    "offset" TEXT NOT NULL,
    "offsetMs" INTEGER NOT NULL,
    "countryId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Nationality" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "countryId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Nationality_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Language" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "native" TEXT NOT NULL,
    "shortCode" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Language_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Community" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Community_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebSource" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WebSource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChannelSource" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ChannelSource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdSource" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AdSource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeadSource" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LeadSource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeadIntention" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LeadIntention_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PropertyType" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PropertyType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PropertyRoom" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PropertyRoom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PropertyAreaSize" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PropertyAreaSize_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Webhook" (
    "id" SERIAL NOT NULL,
    "hookId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Webhook_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebhookRequest" (
    "id" SERIAL NOT NULL,
    "body" JSONB NOT NULL,
    "leadId" INTEGER,
    "webhookId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WebhookRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ChatPermissionToChatType" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ChatTypeToContactType" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EmailDraftToFile" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EmailToFile" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EmailToEntity" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EntityToMessage" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PersonToTag" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LeadToTag" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LeadSearchPresetToLeadStatus" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LeadSearchPresetToTag" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_BusinessProcessToWebhook" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_TagToWebhook" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CountryToLanguage" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE INDEX "Activity_leadId_idx" ON "Activity"("leadId");

-- CreateIndex
CREATE INDEX "Activity_typeId_idx" ON "Activity"("typeId");

-- CreateIndex
CREATE INDEX "Activity_initiatorId_idx" ON "Activity"("initiatorId");

-- CreateIndex
CREATE INDEX "Activity_recipientId_idx" ON "Activity"("recipientId");

-- CreateIndex
CREATE INDEX "Activity_customFieldsValue_idx" ON "Activity" USING GIN ("customFieldsValue" jsonb_path_ops);

-- CreateIndex
CREATE UNIQUE INDEX "SystemActivity_activityId_key" ON "SystemActivity"("activityId");

-- CreateIndex
CREATE UNIQUE INDEX "Update_activityId_key" ON "Update"("activityId");

-- CreateIndex
CREATE UNIQUE INDEX "Comment_activityId_key" ON "Comment"("activityId");

-- CreateIndex
CREATE INDEX "File_hash_idx" ON "File"("hash");

-- CreateIndex
CREATE UNIQUE INDEX "SystemPhone_reservedForLeadId_key" ON "SystemPhone"("reservedForLeadId");

-- CreateIndex
CREATE UNIQUE INDEX "MobileAppFile_version_key" ON "MobileAppFile"("version");

-- CreateIndex
CREATE UNIQUE INDEX "MobileAppFile_fileId_key" ON "MobileAppFile"("fileId");

-- CreateIndex
CREATE UNIQUE INDEX "Call_activityId_key" ON "Call"("activityId");

-- CreateIndex
CREATE UNIQUE INDEX "Call_recordingFileId_key" ON "Call"("recordingFileId");

-- CreateIndex
CREATE INDEX "Call_initiatedPhone_recipientPhone_idx" ON "Call"("initiatedPhone", "recipientPhone");

-- CreateIndex
CREATE UNIQUE INDEX "Message_activityId_key" ON "Message"("activityId");

-- CreateIndex
CREATE UNIQUE INDEX "Message_replyId_key" ON "Message"("replyId");

-- CreateIndex
CREATE UNIQUE INDEX "Chat_photoId_key" ON "Chat"("photoId");

-- CreateIndex
CREATE UNIQUE INDEX "Chat_lastMessageId_key" ON "Chat"("lastMessageId");

-- CreateIndex
CREATE UNIQUE INDEX "Pool_chatId_key" ON "Pool"("chatId");

-- CreateIndex
CREATE INDEX "Contact_typeId_idx" ON "Contact"("typeId");

-- CreateIndex
CREATE INDEX "Contact_ownerId_idx" ON "Contact"("ownerId");

-- CreateIndex
CREATE INDEX "Contact_createdById_idx" ON "Contact"("createdById");

-- CreateIndex
CREATE INDEX "Contact_customFieldsValue_idx" ON "Contact" USING GIN ("customFieldsValue" jsonb_path_ops);

-- CreateIndex
CREATE UNIQUE INDEX "PhoneContact_contactId_key" ON "PhoneContact"("contactId");

-- CreateIndex
CREATE INDEX "PhoneContact_phone_idx" ON "PhoneContact"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "EmailContact_contactId_key" ON "EmailContact"("contactId");

-- CreateIndex
CREATE INDEX "EmailContact_email_idx" ON "EmailContact"("email");

-- CreateIndex
CREATE UNIQUE INDEX "SessionContact_contactId_key" ON "SessionContact"("contactId");

-- CreateIndex
CREATE UNIQUE INDEX "CustomTable_title_key" ON "CustomTable"("title");

-- CreateIndex
CREATE UNIQUE INDEX "Deal_itemId_key" ON "Deal"("itemId");

-- CreateIndex
CREATE UNIQUE INDEX "EmailThread_lastEmailId_key" ON "EmailThread"("lastEmailId");

-- CreateIndex
CREATE UNIQUE INDEX "EmailDraft_threadId_key" ON "EmailDraft"("threadId");

-- CreateIndex
CREATE UNIQUE INDEX "Email_activityId_key" ON "Email"("activityId");

-- CreateIndex
CREATE INDEX "Entity_typeId_idx" ON "Entity"("typeId");

-- CreateIndex
CREATE UNIQUE INDEX "Person_entityId_key" ON "Person"("entityId");

-- CreateIndex
CREATE UNIQUE INDEX "Person_activeCallId_key" ON "Person"("activeCallId");

-- CreateIndex
CREATE INDEX "Person_customFieldsValue_idx" ON "Person" USING GIN ("customFieldsValue" jsonb_path_ops);

-- CreateIndex
CREATE UNIQUE INDEX "Company_entityId_key" ON "Company"("entityId");

-- CreateIndex
CREATE INDEX "Company_customFieldsValue_idx" ON "Company" USING GIN ("customFieldsValue" jsonb_path_ops);

-- CreateIndex
CREATE UNIQUE INDEX "User_personId_key" ON "User"("personId");

-- CreateIndex
CREATE INDEX "User_customFieldsValue_idx" ON "User" USING GIN ("customFieldsValue" jsonb_path_ops);

-- CreateIndex
CREATE UNIQUE INDEX "FollowUpEvent_eventId_key" ON "FollowUpEvent"("eventId");

-- CreateIndex
CREATE UNIQUE INDEX "MeetingEvent_eventId_key" ON "MeetingEvent"("eventId");

-- CreateIndex
CREATE UNIQUE INDEX "Event_activityId_key" ON "Event"("activityId");

-- CreateIndex
CREATE INDEX "Event_isArchived_typeId_idx" ON "Event"("isArchived", "typeId");

-- CreateIndex
CREATE UNIQUE INDEX "Property_itemId_key" ON "Property"("itemId");

-- CreateIndex
CREATE UNIQUE INDEX "Property_projectId_key" ON "Property"("projectId");

-- CreateIndex
CREATE UNIQUE INDEX "Property_unitId_key" ON "Property"("unitId");

-- CreateIndex
CREATE UNIQUE INDEX "Lead_lastFollowUpId_key" ON "Lead"("lastFollowUpId");

-- CreateIndex
CREATE INDEX "Lead_customFieldsValue_idx" ON "Lead" USING GIN ("customFieldsValue" jsonb_path_ops);

-- CreateIndex
CREATE INDEX "Lead_createdAt_idx" ON "Lead"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "Lead_responsibleAgentId_idx" ON "Lead"("responsibleAgentId");

-- CreateIndex
CREATE INDEX "Lead_statusId_idx" ON "Lead"("statusId");

-- CreateIndex
CREATE INDEX "Lead_isPotential_idx" ON "Lead"("isPotential");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_countryId_key" ON "Tag"("countryId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_cityId_key" ON "Tag"("cityId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_nationalityId_key" ON "Tag"("nationalityId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_languageId_key" ON "Tag"("languageId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_adSourceId_key" ON "Tag"("adSourceId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_channelSourceId_key" ON "Tag"("channelSourceId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_webSourceId_key" ON "Tag"("webSourceId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_communityId_key" ON "Tag"("communityId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_projectId_key" ON "Tag"("projectId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_adTagId_key" ON "Tag"("adTagId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_departmentTagId_key" ON "Tag"("departmentTagId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_leadIntentionId_key" ON "Tag"("leadIntentionId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_leadSourceId_key" ON "Tag"("leadSourceId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_propertyTypeId_key" ON "Tag"("propertyTypeId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_propertyRoomId_key" ON "Tag"("propertyRoomId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_propertyAreaSizeId_key" ON "Tag"("propertyAreaSizeId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_customTagId_key" ON "Tag"("customTagId");

-- CreateIndex
CREATE INDEX "Tag_type_idx" ON "Tag"("type");

-- CreateIndex
CREATE UNIQUE INDEX "Country_shortCode1_key" ON "Country"("shortCode1");

-- CreateIndex
CREATE UNIQUE INDEX "Country_shortCode2_key" ON "Country"("shortCode2");

-- CreateIndex
CREATE UNIQUE INDEX "Country_adWordsCode_key" ON "Country"("adWordsCode");

-- CreateIndex
CREATE UNIQUE INDEX "WebSource_url_key" ON "WebSource"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Webhook_hookId_key" ON "Webhook"("hookId");

-- CreateIndex
CREATE UNIQUE INDEX "WebhookRequest_leadId_key" ON "WebhookRequest"("leadId");

-- CreateIndex
CREATE UNIQUE INDEX "_ChatPermissionToChatType_AB_unique" ON "_ChatPermissionToChatType"("A", "B");

-- CreateIndex
CREATE INDEX "_ChatPermissionToChatType_B_index" ON "_ChatPermissionToChatType"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ChatTypeToContactType_AB_unique" ON "_ChatTypeToContactType"("A", "B");

-- CreateIndex
CREATE INDEX "_ChatTypeToContactType_B_index" ON "_ChatTypeToContactType"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EmailDraftToFile_AB_unique" ON "_EmailDraftToFile"("A", "B");

-- CreateIndex
CREATE INDEX "_EmailDraftToFile_B_index" ON "_EmailDraftToFile"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EmailToFile_AB_unique" ON "_EmailToFile"("A", "B");

-- CreateIndex
CREATE INDEX "_EmailToFile_B_index" ON "_EmailToFile"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EmailToEntity_AB_unique" ON "_EmailToEntity"("A", "B");

-- CreateIndex
CREATE INDEX "_EmailToEntity_B_index" ON "_EmailToEntity"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EntityToMessage_AB_unique" ON "_EntityToMessage"("A", "B");

-- CreateIndex
CREATE INDEX "_EntityToMessage_B_index" ON "_EntityToMessage"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PersonToTag_AB_unique" ON "_PersonToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_PersonToTag_B_index" ON "_PersonToTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LeadToTag_AB_unique" ON "_LeadToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_LeadToTag_B_index" ON "_LeadToTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LeadSearchPresetToLeadStatus_AB_unique" ON "_LeadSearchPresetToLeadStatus"("A", "B");

-- CreateIndex
CREATE INDEX "_LeadSearchPresetToLeadStatus_B_index" ON "_LeadSearchPresetToLeadStatus"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LeadSearchPresetToTag_AB_unique" ON "_LeadSearchPresetToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_LeadSearchPresetToTag_B_index" ON "_LeadSearchPresetToTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BusinessProcessToWebhook_AB_unique" ON "_BusinessProcessToWebhook"("A", "B");

-- CreateIndex
CREATE INDEX "_BusinessProcessToWebhook_B_index" ON "_BusinessProcessToWebhook"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_TagToWebhook_AB_unique" ON "_TagToWebhook"("A", "B");

-- CreateIndex
CREATE INDEX "_TagToWebhook_B_index" ON "_TagToWebhook"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CountryToLanguage_AB_unique" ON "_CountryToLanguage"("A", "B");

-- CreateIndex
CREATE INDEX "_CountryToLanguage_B_index" ON "_CountryToLanguage"("B");

-- AddForeignKey
ALTER TABLE "Activity" ADD CONSTRAINT "Activity_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "ActivityType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Activity" ADD CONSTRAINT "Activity_initiatorId_fkey" FOREIGN KEY ("initiatorId") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Activity" ADD CONSTRAINT "Activity_recipientId_fkey" FOREIGN KEY ("recipientId") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Activity" ADD CONSTRAINT "Activity_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SystemActivity" ADD CONSTRAINT "SystemActivity_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Update" ADD CONSTRAINT "Update_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SystemPhone" ADD CONSTRAINT "SystemPhone_reservedForLeadId_fkey" FOREIGN KEY ("reservedForLeadId") REFERENCES "Lead"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MobileAppFile" ADD CONSTRAINT "MobileAppFile_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "File"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Call" ADD CONSTRAINT "Call_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Call" ADD CONSTRAINT "Call_recordingFileId_fkey" FOREIGN KEY ("recordingFileId") REFERENCES "File"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Call" ADD CONSTRAINT "Call_callTypeId_fkey" FOREIGN KEY ("callTypeId") REFERENCES "CallType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Call" ADD CONSTRAINT "Call_systemPhoneId_fkey" FOREIGN KEY ("systemPhoneId") REFERENCES "SystemPhone"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "File"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_replyId_fkey" FOREIGN KEY ("replyId") REFERENCES "Message"("activityId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatParticipants" ADD CONSTRAINT "ChatParticipants_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatParticipants" ADD CONSTRAINT "ChatParticipants_entityId_fkey" FOREIGN KEY ("entityId") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatParticipants" ADD CONSTRAINT "ChatParticipants_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "Contact"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chat" ADD CONSTRAINT "Chat_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "ChatType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chat" ADD CONSTRAINT "Chat_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chat" ADD CONSTRAINT "Chat_photoId_fkey" FOREIGN KEY ("photoId") REFERENCES "File"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chat" ADD CONSTRAINT "Chat_lastMessageId_fkey" FOREIGN KEY ("lastMessageId") REFERENCES "Message"("activityId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PoolOnUser" ADD CONSTRAINT "PoolOnUser_poolId_fkey" FOREIGN KEY ("poolId") REFERENCES "Pool"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PoolOnUser" ADD CONSTRAINT "PoolOnUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("personId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pool" ADD CONSTRAINT "Pool_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "ContactType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhoneContact" ADD CONSTRAINT "PhoneContact_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "Contact"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailContact" ADD CONSTRAINT "EmailContact_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "Contact"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SessionContact" ADD CONSTRAINT "SessionContact_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "Contact"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SessionContact" ADD CONSTRAINT "SessionContact_webhookId_fkey" FOREIGN KEY ("webhookId") REFERENCES "Webhook"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomTableValue" ADD CONSTRAINT "CustomTableValue_tableId_fkey" FOREIGN KEY ("tableId") REFERENCES "CustomTable"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Deal" ADD CONSTRAINT "Deal_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "Item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Deal" ADD CONSTRAINT "Deal_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "DealStatus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Deal" ADD CONSTRAINT "Deal_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "DealType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailThread" ADD CONSTRAINT "EmailThread_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "Contact"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailThread" ADD CONSTRAINT "EmailThread_lastEmailId_fkey" FOREIGN KEY ("lastEmailId") REFERENCES "Email"("activityId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailDraft" ADD CONSTRAINT "EmailDraft_threadId_fkey" FOREIGN KEY ("threadId") REFERENCES "EmailThread"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Email" ADD CONSTRAINT "Email_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Email" ADD CONSTRAINT "Email_threadId_fkey" FOREIGN KEY ("threadId") REFERENCES "EmailThread"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Entity" ADD CONSTRAINT "Entity_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES "Color"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Entity" ADD CONSTRAINT "Entity_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "EntityType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Entity" ADD CONSTRAINT "Entity_connectionId_fkey" FOREIGN KEY ("connectionId") REFERENCES "Entity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PersonAttachment" ADD CONSTRAINT "PersonAttachment_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person"("entityId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PersonAttachment" ADD CONSTRAINT "PersonAttachment_attachmentId_fkey" FOREIGN KEY ("attachmentId") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Person" ADD CONSTRAINT "Person_entityId_fkey" FOREIGN KEY ("entityId") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Person" ADD CONSTRAINT "Person_activeCallId_fkey" FOREIGN KEY ("activeCallId") REFERENCES "Call"("activityId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Person" ADD CONSTRAINT "Person_avatarId_fkey" FOREIGN KEY ("avatarId") REFERENCES "File"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Company" ADD CONSTRAINT "Company_entityId_fkey" FOREIGN KEY ("entityId") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Company" ADD CONSTRAINT "Company_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "CompanyType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person"("entityId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSession" ADD CONSTRAINT "UserSession_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("personId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserLocation" ADD CONSTRAINT "UserLocation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("personId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FollowUpEvent" ADD CONSTRAINT "FollowUpEvent_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("activityId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FollowUpEvent" ADD CONSTRAINT "FollowUpEvent_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "FollowUpType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MeetingEvent" ADD CONSTRAINT "MeetingEvent_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("activityId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventInvites" ADD CONSTRAINT "EventInvites_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("activityId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventInvites" ADD CONSTRAINT "EventInvites_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("personId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "EventType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_alertId_fkey" FOREIGN KEY ("alertId") REFERENCES "EventAlertType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Property" ADD CONSTRAINT "Property_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "Item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Property" ADD CONSTRAINT "Property_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "PropertyType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Property" ADD CONSTRAINT "Property_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lead" ADD CONSTRAINT "Lead_contactedSystemPhoneId_fkey" FOREIGN KEY ("contactedSystemPhoneId") REFERENCES "SystemPhone"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lead" ADD CONSTRAINT "Lead_responsibleAgentId_fkey" FOREIGN KEY ("responsibleAgentId") REFERENCES "User"("personId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lead" ADD CONSTRAINT "Lead_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person"("entityId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lead" ADD CONSTRAINT "Lead_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "LeadStatus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lead" ADD CONSTRAINT "Lead_lastFollowUpId_fkey" FOREIGN KEY ("lastFollowUpId") REFERENCES "Event"("activityId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeadSearchPreset" ADD CONSTRAINT "LeadSearchPreset_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("personId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeadSearchPreset" ADD CONSTRAINT "LeadSearchPreset_responsibleAgentId_fkey" FOREIGN KEY ("responsibleAgentId") REFERENCES "User"("personId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeadSearchPreset" ADD CONSTRAINT "LeadSearchPreset_periodId_fkey" FOREIGN KEY ("periodId") REFERENCES "SearchPeriod"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Department" ADD CONSTRAINT "Department_headId_fkey" FOREIGN KEY ("headId") REFERENCES "User"("personId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Department" ADD CONSTRAINT "Department_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DepartmentToUser" ADD CONSTRAINT "DepartmentToUser_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DepartmentToUser" ADD CONSTRAINT "DepartmentToUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("personId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DepartmentToUser" ADD CONSTRAINT "DepartmentToUser_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoleToUser" ADD CONSTRAINT "RoleToUser_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoleToUser" ADD CONSTRAINT "RoleToUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("personId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Permission" ADD CONSTRAINT "Permission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Permission" ADD CONSTRAINT "Permission_businessProcessId_fkey" FOREIGN KEY ("businessProcessId") REFERENCES "BusinessProcess"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "TagCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_nationalityId_fkey" FOREIGN KEY ("nationalityId") REFERENCES "Nationality"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "Language"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_adSourceId_fkey" FOREIGN KEY ("adSourceId") REFERENCES "AdSource"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_channelSourceId_fkey" FOREIGN KEY ("channelSourceId") REFERENCES "ChannelSource"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_webSourceId_fkey" FOREIGN KEY ("webSourceId") REFERENCES "WebSource"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_communityId_fkey" FOREIGN KEY ("communityId") REFERENCES "Community"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_adTagId_fkey" FOREIGN KEY ("adTagId") REFERENCES "AdTag"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_departmentTagId_fkey" FOREIGN KEY ("departmentTagId") REFERENCES "DepartmentTag"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_leadIntentionId_fkey" FOREIGN KEY ("leadIntentionId") REFERENCES "LeadIntention"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_leadSourceId_fkey" FOREIGN KEY ("leadSourceId") REFERENCES "LeadSource"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_propertyTypeId_fkey" FOREIGN KEY ("propertyTypeId") REFERENCES "PropertyType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_propertyRoomId_fkey" FOREIGN KEY ("propertyRoomId") REFERENCES "PropertyRoom"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_propertyAreaSizeId_fkey" FOREIGN KEY ("propertyAreaSizeId") REFERENCES "PropertyAreaSize"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_customTagId_fkey" FOREIGN KEY ("customTagId") REFERENCES "CustomTag"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdTag" ADD CONSTRAINT "AdTag_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdTag" ADD CONSTRAINT "AdTag_adSourceId_fkey" FOREIGN KEY ("adSourceId") REFERENCES "AdSource"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Nationality" ADD CONSTRAINT "Nationality_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("entityId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebhookRequest" ADD CONSTRAINT "WebhookRequest_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebhookRequest" ADD CONSTRAINT "WebhookRequest_webhookId_fkey" FOREIGN KEY ("webhookId") REFERENCES "Webhook"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChatPermissionToChatType" ADD CONSTRAINT "_ChatPermissionToChatType_A_fkey" FOREIGN KEY ("A") REFERENCES "ChatPermission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChatPermissionToChatType" ADD CONSTRAINT "_ChatPermissionToChatType_B_fkey" FOREIGN KEY ("B") REFERENCES "ChatType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChatTypeToContactType" ADD CONSTRAINT "_ChatTypeToContactType_A_fkey" FOREIGN KEY ("A") REFERENCES "ChatType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChatTypeToContactType" ADD CONSTRAINT "_ChatTypeToContactType_B_fkey" FOREIGN KEY ("B") REFERENCES "ContactType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmailDraftToFile" ADD CONSTRAINT "_EmailDraftToFile_A_fkey" FOREIGN KEY ("A") REFERENCES "EmailDraft"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmailDraftToFile" ADD CONSTRAINT "_EmailDraftToFile_B_fkey" FOREIGN KEY ("B") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmailToFile" ADD CONSTRAINT "_EmailToFile_A_fkey" FOREIGN KEY ("A") REFERENCES "Email"("activityId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmailToFile" ADD CONSTRAINT "_EmailToFile_B_fkey" FOREIGN KEY ("B") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmailToEntity" ADD CONSTRAINT "_EmailToEntity_A_fkey" FOREIGN KEY ("A") REFERENCES "Email"("activityId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmailToEntity" ADD CONSTRAINT "_EmailToEntity_B_fkey" FOREIGN KEY ("B") REFERENCES "Entity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EntityToMessage" ADD CONSTRAINT "_EntityToMessage_A_fkey" FOREIGN KEY ("A") REFERENCES "Entity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EntityToMessage" ADD CONSTRAINT "_EntityToMessage_B_fkey" FOREIGN KEY ("B") REFERENCES "Message"("activityId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonToTag" ADD CONSTRAINT "_PersonToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Person"("entityId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonToTag" ADD CONSTRAINT "_PersonToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LeadToTag" ADD CONSTRAINT "_LeadToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Lead"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LeadToTag" ADD CONSTRAINT "_LeadToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LeadSearchPresetToLeadStatus" ADD CONSTRAINT "_LeadSearchPresetToLeadStatus_A_fkey" FOREIGN KEY ("A") REFERENCES "LeadSearchPreset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LeadSearchPresetToLeadStatus" ADD CONSTRAINT "_LeadSearchPresetToLeadStatus_B_fkey" FOREIGN KEY ("B") REFERENCES "LeadStatus"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LeadSearchPresetToTag" ADD CONSTRAINT "_LeadSearchPresetToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "LeadSearchPreset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LeadSearchPresetToTag" ADD CONSTRAINT "_LeadSearchPresetToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BusinessProcessToWebhook" ADD CONSTRAINT "_BusinessProcessToWebhook_A_fkey" FOREIGN KEY ("A") REFERENCES "BusinessProcess"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BusinessProcessToWebhook" ADD CONSTRAINT "_BusinessProcessToWebhook_B_fkey" FOREIGN KEY ("B") REFERENCES "Webhook"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TagToWebhook" ADD CONSTRAINT "_TagToWebhook_A_fkey" FOREIGN KEY ("A") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TagToWebhook" ADD CONSTRAINT "_TagToWebhook_B_fkey" FOREIGN KEY ("B") REFERENCES "Webhook"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToLanguage" ADD CONSTRAINT "_CountryToLanguage_A_fkey" FOREIGN KEY ("A") REFERENCES "Country"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToLanguage" ADD CONSTRAINT "_CountryToLanguage_B_fkey" FOREIGN KEY ("B") REFERENCES "Language"("id") ON DELETE CASCADE ON UPDATE CASCADE;
