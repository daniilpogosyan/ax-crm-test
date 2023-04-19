/*
  Warnings:

  - The values [AD_SOURCE,CHANNEL_SOURCE,WEB_SOURCE,COMMUNITY,PROJECT,AD_TAG,DEPARTMENT,LEAD_INTENTION,LEAD_SOURCE,PROPERTY_TYPE,PROPERTY_ROOM,PROPERTY_AREA_SIZE,CUSTOM] on the enum `TagType` will be removed. If these variants are still used in the database, this will fail.
  - The primary key for the `Event` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `activityId` on the `Event` table. All the data in the column will be lost.
  - You are about to drop the column `alertId` on the `Event` table. All the data in the column will be lost.
  - You are about to drop the column `invitedEmails` on the `Event` table. All the data in the column will be lost.
  - You are about to drop the column `isArchived` on the `Event` table. All the data in the column will be lost.
  - You are about to drop the column `allDay` on the `FollowUpEvent` table. All the data in the column will be lost.
  - You are about to drop the column `contactedSystemPhoneId` on the `Lead` table. All the data in the column will be lost.
  - You are about to drop the column `customFieldsValue` on the `Lead` table. All the data in the column will be lost.
  - You are about to drop the column `isPotential` on the `Lead` table. All the data in the column will be lost.
  - You are about to drop the column `itemType` on the `Lead` table. All the data in the column will be lost.
  - You are about to drop the column `lastFollowUpId` on the `Lead` table. All the data in the column will be lost.
  - You are about to drop the column `personId` on the `Lead` table. All the data in the column will be lost.
  - You are about to drop the column `quality` on the `Lead` table. All the data in the column will be lost.
  - You are about to drop the column `responsibleAgentId` on the `Lead` table. All the data in the column will be lost.
  - You are about to drop the column `sourceDetails` on the `Lead` table. All the data in the column will be lost.
  - You are about to drop the column `adSourceId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `adTagId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `channelSourceId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `communityId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `conditional` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `customTagId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `departmentTagId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `leadIntentionId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `leadSourceId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `projectId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `propertyAreaSizeId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `propertyRoomId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `propertyTypeId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `webSourceId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `combineGroups` on the `TagCategory` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `TagCategory` table. All the data in the column will be lost.
  - You are about to drop the `Activity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ActivityType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AdSource` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AdTag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Animal` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `BusinessProcess` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Call` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CallState` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CallType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ChannelSource` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Chat` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ChatParticipants` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ChatPermission` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ChatType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Color` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Comment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Community` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Company` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CompanyType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Contact` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ContactType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CustomTable` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CustomTableValue` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CustomTag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Deal` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DealStatus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DealType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Department` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DepartmentTag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DepartmentToUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Email` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EmailContact` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EmailDraft` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EmailThread` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Entity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EntityType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EventAlertType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EventInvites` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `File` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Item` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `LeadIntention` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `LeadSearchPreset` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `LeadSource` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Message` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MobileAppFile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Permission` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Person` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PersonAttachment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PhoneContact` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Pool` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PoolOnUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Project` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Property` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PropertyAreaSize` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PropertyRoom` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PropertyType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Role` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RoleToUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SearchPeriod` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SessionContact` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SystemActivity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SystemPhone` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Update` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserLocation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserSession` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WebSource` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Webhook` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WebhookRequest` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_BusinessProcessToWebhook` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ChatPermissionToChatType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ChatTypeToContactType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_EmailDraftToFile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_EmailToEntity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_EmailToFile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_EntityToMessage` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_LeadSearchPresetToLeadStatus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_LeadSearchPresetToTag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_LeadToTag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PersonToTag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_TagToWebhook` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `id` to the `Event` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "TagType_new" AS ENUM ('COUNTRY', 'CITY', 'NATIONALITY', 'LANGUAGE');
ALTER TABLE "Tag" ALTER COLUMN "type" TYPE "TagType_new" USING ("type"::text::"TagType_new");
ALTER TYPE "TagType" RENAME TO "TagType_old";
ALTER TYPE "TagType_new" RENAME TO "TagType";
DROP TYPE "TagType_old";
COMMIT;

-- DropForeignKey
ALTER TABLE "Activity" DROP CONSTRAINT "Activity_initiatorId_fkey";

-- DropForeignKey
ALTER TABLE "Activity" DROP CONSTRAINT "Activity_leadId_fkey";

-- DropForeignKey
ALTER TABLE "Activity" DROP CONSTRAINT "Activity_recipientId_fkey";

-- DropForeignKey
ALTER TABLE "Activity" DROP CONSTRAINT "Activity_typeId_fkey";

-- DropForeignKey
ALTER TABLE "AdTag" DROP CONSTRAINT "AdTag_adSourceId_fkey";

-- DropForeignKey
ALTER TABLE "AdTag" DROP CONSTRAINT "AdTag_countryId_fkey";

-- DropForeignKey
ALTER TABLE "Call" DROP CONSTRAINT "Call_activityId_fkey";

-- DropForeignKey
ALTER TABLE "Call" DROP CONSTRAINT "Call_callTypeId_fkey";

-- DropForeignKey
ALTER TABLE "Call" DROP CONSTRAINT "Call_recordingFileId_fkey";

-- DropForeignKey
ALTER TABLE "Call" DROP CONSTRAINT "Call_systemPhoneId_fkey";

-- DropForeignKey
ALTER TABLE "Chat" DROP CONSTRAINT "Chat_lastMessageId_fkey";

-- DropForeignKey
ALTER TABLE "Chat" DROP CONSTRAINT "Chat_leadId_fkey";

-- DropForeignKey
ALTER TABLE "Chat" DROP CONSTRAINT "Chat_photoId_fkey";

-- DropForeignKey
ALTER TABLE "Chat" DROP CONSTRAINT "Chat_typeId_fkey";

-- DropForeignKey
ALTER TABLE "ChatParticipants" DROP CONSTRAINT "ChatParticipants_chatId_fkey";

-- DropForeignKey
ALTER TABLE "ChatParticipants" DROP CONSTRAINT "ChatParticipants_contactId_fkey";

-- DropForeignKey
ALTER TABLE "ChatParticipants" DROP CONSTRAINT "ChatParticipants_entityId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_activityId_fkey";

-- DropForeignKey
ALTER TABLE "Company" DROP CONSTRAINT "Company_entityId_fkey";

-- DropForeignKey
ALTER TABLE "Company" DROP CONSTRAINT "Company_typeId_fkey";

-- DropForeignKey
ALTER TABLE "Contact" DROP CONSTRAINT "Contact_createdById_fkey";

-- DropForeignKey
ALTER TABLE "Contact" DROP CONSTRAINT "Contact_leadId_fkey";

-- DropForeignKey
ALTER TABLE "Contact" DROP CONSTRAINT "Contact_ownerId_fkey";

-- DropForeignKey
ALTER TABLE "Contact" DROP CONSTRAINT "Contact_typeId_fkey";

-- DropForeignKey
ALTER TABLE "CustomTableValue" DROP CONSTRAINT "CustomTableValue_tableId_fkey";

-- DropForeignKey
ALTER TABLE "Deal" DROP CONSTRAINT "Deal_itemId_fkey";

-- DropForeignKey
ALTER TABLE "Deal" DROP CONSTRAINT "Deal_statusId_fkey";

-- DropForeignKey
ALTER TABLE "Deal" DROP CONSTRAINT "Deal_typeId_fkey";

-- DropForeignKey
ALTER TABLE "Department" DROP CONSTRAINT "Department_headId_fkey";

-- DropForeignKey
ALTER TABLE "Department" DROP CONSTRAINT "Department_parentId_fkey";

-- DropForeignKey
ALTER TABLE "DepartmentToUser" DROP CONSTRAINT "DepartmentToUser_departmentId_fkey";

-- DropForeignKey
ALTER TABLE "DepartmentToUser" DROP CONSTRAINT "DepartmentToUser_roleId_fkey";

-- DropForeignKey
ALTER TABLE "DepartmentToUser" DROP CONSTRAINT "DepartmentToUser_userId_fkey";

-- DropForeignKey
ALTER TABLE "Email" DROP CONSTRAINT "Email_activityId_fkey";

-- DropForeignKey
ALTER TABLE "Email" DROP CONSTRAINT "Email_threadId_fkey";

-- DropForeignKey
ALTER TABLE "EmailContact" DROP CONSTRAINT "EmailContact_contactId_fkey";

-- DropForeignKey
ALTER TABLE "EmailDraft" DROP CONSTRAINT "EmailDraft_threadId_fkey";

-- DropForeignKey
ALTER TABLE "EmailThread" DROP CONSTRAINT "EmailThread_lastEmailId_fkey";

-- DropForeignKey
ALTER TABLE "EmailThread" DROP CONSTRAINT "EmailThread_ownerId_fkey";

-- DropForeignKey
ALTER TABLE "Entity" DROP CONSTRAINT "Entity_colorId_fkey";

-- DropForeignKey
ALTER TABLE "Entity" DROP CONSTRAINT "Entity_connectionId_fkey";

-- DropForeignKey
ALTER TABLE "Entity" DROP CONSTRAINT "Entity_typeId_fkey";

-- DropForeignKey
ALTER TABLE "Event" DROP CONSTRAINT "Event_activityId_fkey";

-- DropForeignKey
ALTER TABLE "Event" DROP CONSTRAINT "Event_alertId_fkey";

-- DropForeignKey
ALTER TABLE "EventInvites" DROP CONSTRAINT "EventInvites_eventId_fkey";

-- DropForeignKey
ALTER TABLE "EventInvites" DROP CONSTRAINT "EventInvites_userId_fkey";

-- DropForeignKey
ALTER TABLE "FollowUpEvent" DROP CONSTRAINT "FollowUpEvent_eventId_fkey";

-- DropForeignKey
ALTER TABLE "Lead" DROP CONSTRAINT "Lead_contactedSystemPhoneId_fkey";

-- DropForeignKey
ALTER TABLE "Lead" DROP CONSTRAINT "Lead_lastFollowUpId_fkey";

-- DropForeignKey
ALTER TABLE "Lead" DROP CONSTRAINT "Lead_personId_fkey";

-- DropForeignKey
ALTER TABLE "Lead" DROP CONSTRAINT "Lead_responsibleAgentId_fkey";

-- DropForeignKey
ALTER TABLE "LeadSearchPreset" DROP CONSTRAINT "LeadSearchPreset_ownerId_fkey";

-- DropForeignKey
ALTER TABLE "LeadSearchPreset" DROP CONSTRAINT "LeadSearchPreset_periodId_fkey";

-- DropForeignKey
ALTER TABLE "LeadSearchPreset" DROP CONSTRAINT "LeadSearchPreset_responsibleAgentId_fkey";

-- DropForeignKey
ALTER TABLE "MeetingEvent" DROP CONSTRAINT "MeetingEvent_eventId_fkey";

-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_activityId_fkey";

-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_chatId_fkey";

-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_mediaId_fkey";

-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_replyId_fkey";

-- DropForeignKey
ALTER TABLE "MobileAppFile" DROP CONSTRAINT "MobileAppFile_fileId_fkey";

-- DropForeignKey
ALTER TABLE "Permission" DROP CONSTRAINT "Permission_businessProcessId_fkey";

-- DropForeignKey
ALTER TABLE "Permission" DROP CONSTRAINT "Permission_roleId_fkey";

-- DropForeignKey
ALTER TABLE "Person" DROP CONSTRAINT "Person_activeCallId_fkey";

-- DropForeignKey
ALTER TABLE "Person" DROP CONSTRAINT "Person_avatarId_fkey";

-- DropForeignKey
ALTER TABLE "Person" DROP CONSTRAINT "Person_entityId_fkey";

-- DropForeignKey
ALTER TABLE "PersonAttachment" DROP CONSTRAINT "PersonAttachment_attachmentId_fkey";

-- DropForeignKey
ALTER TABLE "PersonAttachment" DROP CONSTRAINT "PersonAttachment_personId_fkey";

-- DropForeignKey
ALTER TABLE "PhoneContact" DROP CONSTRAINT "PhoneContact_contactId_fkey";

-- DropForeignKey
ALTER TABLE "Pool" DROP CONSTRAINT "Pool_chatId_fkey";

-- DropForeignKey
ALTER TABLE "PoolOnUser" DROP CONSTRAINT "PoolOnUser_poolId_fkey";

-- DropForeignKey
ALTER TABLE "PoolOnUser" DROP CONSTRAINT "PoolOnUser_userId_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_companyId_fkey";

-- DropForeignKey
ALTER TABLE "Property" DROP CONSTRAINT "Property_itemId_fkey";

-- DropForeignKey
ALTER TABLE "Property" DROP CONSTRAINT "Property_projectId_fkey";

-- DropForeignKey
ALTER TABLE "Property" DROP CONSTRAINT "Property_typeId_fkey";

-- DropForeignKey
ALTER TABLE "RoleToUser" DROP CONSTRAINT "RoleToUser_roleId_fkey";

-- DropForeignKey
ALTER TABLE "RoleToUser" DROP CONSTRAINT "RoleToUser_userId_fkey";

-- DropForeignKey
ALTER TABLE "SessionContact" DROP CONSTRAINT "SessionContact_contactId_fkey";

-- DropForeignKey
ALTER TABLE "SessionContact" DROP CONSTRAINT "SessionContact_webhookId_fkey";

-- DropForeignKey
ALTER TABLE "SystemActivity" DROP CONSTRAINT "SystemActivity_activityId_fkey";

-- DropForeignKey
ALTER TABLE "SystemPhone" DROP CONSTRAINT "SystemPhone_reservedForLeadId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_adSourceId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_adTagId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_channelSourceId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_communityId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_customTagId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_departmentTagId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_leadIntentionId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_leadSourceId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_projectId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_propertyAreaSizeId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_propertyRoomId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_propertyTypeId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_webSourceId_fkey";

-- DropForeignKey
ALTER TABLE "Update" DROP CONSTRAINT "Update_activityId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_personId_fkey";

-- DropForeignKey
ALTER TABLE "UserLocation" DROP CONSTRAINT "UserLocation_userId_fkey";

-- DropForeignKey
ALTER TABLE "UserSession" DROP CONSTRAINT "UserSession_userId_fkey";

-- DropForeignKey
ALTER TABLE "WebhookRequest" DROP CONSTRAINT "WebhookRequest_leadId_fkey";

-- DropForeignKey
ALTER TABLE "WebhookRequest" DROP CONSTRAINT "WebhookRequest_webhookId_fkey";

-- DropForeignKey
ALTER TABLE "_BusinessProcessToWebhook" DROP CONSTRAINT "_BusinessProcessToWebhook_A_fkey";

-- DropForeignKey
ALTER TABLE "_BusinessProcessToWebhook" DROP CONSTRAINT "_BusinessProcessToWebhook_B_fkey";

-- DropForeignKey
ALTER TABLE "_ChatPermissionToChatType" DROP CONSTRAINT "_ChatPermissionToChatType_A_fkey";

-- DropForeignKey
ALTER TABLE "_ChatPermissionToChatType" DROP CONSTRAINT "_ChatPermissionToChatType_B_fkey";

-- DropForeignKey
ALTER TABLE "_ChatTypeToContactType" DROP CONSTRAINT "_ChatTypeToContactType_A_fkey";

-- DropForeignKey
ALTER TABLE "_ChatTypeToContactType" DROP CONSTRAINT "_ChatTypeToContactType_B_fkey";

-- DropForeignKey
ALTER TABLE "_EmailDraftToFile" DROP CONSTRAINT "_EmailDraftToFile_A_fkey";

-- DropForeignKey
ALTER TABLE "_EmailDraftToFile" DROP CONSTRAINT "_EmailDraftToFile_B_fkey";

-- DropForeignKey
ALTER TABLE "_EmailToEntity" DROP CONSTRAINT "_EmailToEntity_A_fkey";

-- DropForeignKey
ALTER TABLE "_EmailToEntity" DROP CONSTRAINT "_EmailToEntity_B_fkey";

-- DropForeignKey
ALTER TABLE "_EmailToFile" DROP CONSTRAINT "_EmailToFile_A_fkey";

-- DropForeignKey
ALTER TABLE "_EmailToFile" DROP CONSTRAINT "_EmailToFile_B_fkey";

-- DropForeignKey
ALTER TABLE "_EntityToMessage" DROP CONSTRAINT "_EntityToMessage_A_fkey";

-- DropForeignKey
ALTER TABLE "_EntityToMessage" DROP CONSTRAINT "_EntityToMessage_B_fkey";

-- DropForeignKey
ALTER TABLE "_LeadSearchPresetToLeadStatus" DROP CONSTRAINT "_LeadSearchPresetToLeadStatus_A_fkey";

-- DropForeignKey
ALTER TABLE "_LeadSearchPresetToLeadStatus" DROP CONSTRAINT "_LeadSearchPresetToLeadStatus_B_fkey";

-- DropForeignKey
ALTER TABLE "_LeadSearchPresetToTag" DROP CONSTRAINT "_LeadSearchPresetToTag_A_fkey";

-- DropForeignKey
ALTER TABLE "_LeadSearchPresetToTag" DROP CONSTRAINT "_LeadSearchPresetToTag_B_fkey";

-- DropForeignKey
ALTER TABLE "_LeadToTag" DROP CONSTRAINT "_LeadToTag_A_fkey";

-- DropForeignKey
ALTER TABLE "_LeadToTag" DROP CONSTRAINT "_LeadToTag_B_fkey";

-- DropForeignKey
ALTER TABLE "_PersonToTag" DROP CONSTRAINT "_PersonToTag_A_fkey";

-- DropForeignKey
ALTER TABLE "_PersonToTag" DROP CONSTRAINT "_PersonToTag_B_fkey";

-- DropForeignKey
ALTER TABLE "_TagToWebhook" DROP CONSTRAINT "_TagToWebhook_A_fkey";

-- DropForeignKey
ALTER TABLE "_TagToWebhook" DROP CONSTRAINT "_TagToWebhook_B_fkey";

-- DropIndex
DROP INDEX "Event_activityId_key";

-- DropIndex
DROP INDEX "Event_isArchived_typeId_idx";

-- DropIndex
DROP INDEX "Lead_createdAt_idx";

-- DropIndex
DROP INDEX "Lead_customFieldsValue_idx";

-- DropIndex
DROP INDEX "Lead_isPotential_idx";

-- DropIndex
DROP INDEX "Lead_lastFollowUpId_key";

-- DropIndex
DROP INDEX "Lead_responsibleAgentId_idx";

-- DropIndex
DROP INDEX "Lead_statusId_idx";

-- DropIndex
DROP INDEX "Tag_adSourceId_key";

-- DropIndex
DROP INDEX "Tag_adTagId_key";

-- DropIndex
DROP INDEX "Tag_channelSourceId_key";

-- DropIndex
DROP INDEX "Tag_communityId_key";

-- DropIndex
DROP INDEX "Tag_customTagId_key";

-- DropIndex
DROP INDEX "Tag_departmentTagId_key";

-- DropIndex
DROP INDEX "Tag_leadIntentionId_key";

-- DropIndex
DROP INDEX "Tag_leadSourceId_key";

-- DropIndex
DROP INDEX "Tag_projectId_key";

-- DropIndex
DROP INDEX "Tag_propertyAreaSizeId_key";

-- DropIndex
DROP INDEX "Tag_propertyRoomId_key";

-- DropIndex
DROP INDEX "Tag_propertyTypeId_key";

-- DropIndex
DROP INDEX "Tag_webSourceId_key";

-- AlterTable
ALTER TABLE "Event" DROP CONSTRAINT "Event_pkey",
DROP COLUMN "activityId",
DROP COLUMN "alertId",
DROP COLUMN "invitedEmails",
DROP COLUMN "isArchived",
ADD COLUMN     "id" INTEGER NOT NULL,
ADD CONSTRAINT "Event_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "FollowUpEvent" DROP COLUMN "allDay";

-- AlterTable
ALTER TABLE "Lead" DROP COLUMN "contactedSystemPhoneId",
DROP COLUMN "customFieldsValue",
DROP COLUMN "isPotential",
DROP COLUMN "itemType",
DROP COLUMN "lastFollowUpId",
DROP COLUMN "personId",
DROP COLUMN "quality",
DROP COLUMN "responsibleAgentId",
DROP COLUMN "sourceDetails";

-- AlterTable
ALTER TABLE "Tag" DROP COLUMN "adSourceId",
DROP COLUMN "adTagId",
DROP COLUMN "channelSourceId",
DROP COLUMN "communityId",
DROP COLUMN "conditional",
DROP COLUMN "customTagId",
DROP COLUMN "departmentTagId",
DROP COLUMN "leadIntentionId",
DROP COLUMN "leadSourceId",
DROP COLUMN "projectId",
DROP COLUMN "propertyAreaSizeId",
DROP COLUMN "propertyRoomId",
DROP COLUMN "propertyTypeId",
DROP COLUMN "webSourceId",
ADD COLUMN     "leadId" INTEGER;

-- AlterTable
ALTER TABLE "TagCategory" DROP COLUMN "combineGroups",
DROP COLUMN "type";

-- DropTable
DROP TABLE "Activity";

-- DropTable
DROP TABLE "ActivityType";

-- DropTable
DROP TABLE "AdSource";

-- DropTable
DROP TABLE "AdTag";

-- DropTable
DROP TABLE "Animal";

-- DropTable
DROP TABLE "BusinessProcess";

-- DropTable
DROP TABLE "Call";

-- DropTable
DROP TABLE "CallState";

-- DropTable
DROP TABLE "CallType";

-- DropTable
DROP TABLE "ChannelSource";

-- DropTable
DROP TABLE "Chat";

-- DropTable
DROP TABLE "ChatParticipants";

-- DropTable
DROP TABLE "ChatPermission";

-- DropTable
DROP TABLE "ChatType";

-- DropTable
DROP TABLE "Color";

-- DropTable
DROP TABLE "Comment";

-- DropTable
DROP TABLE "Community";

-- DropTable
DROP TABLE "Company";

-- DropTable
DROP TABLE "CompanyType";

-- DropTable
DROP TABLE "Contact";

-- DropTable
DROP TABLE "ContactType";

-- DropTable
DROP TABLE "CustomTable";

-- DropTable
DROP TABLE "CustomTableValue";

-- DropTable
DROP TABLE "CustomTag";

-- DropTable
DROP TABLE "Deal";

-- DropTable
DROP TABLE "DealStatus";

-- DropTable
DROP TABLE "DealType";

-- DropTable
DROP TABLE "Department";

-- DropTable
DROP TABLE "DepartmentTag";

-- DropTable
DROP TABLE "DepartmentToUser";

-- DropTable
DROP TABLE "Email";

-- DropTable
DROP TABLE "EmailContact";

-- DropTable
DROP TABLE "EmailDraft";

-- DropTable
DROP TABLE "EmailThread";

-- DropTable
DROP TABLE "Entity";

-- DropTable
DROP TABLE "EntityType";

-- DropTable
DROP TABLE "EventAlertType";

-- DropTable
DROP TABLE "EventInvites";

-- DropTable
DROP TABLE "File";

-- DropTable
DROP TABLE "Item";

-- DropTable
DROP TABLE "LeadIntention";

-- DropTable
DROP TABLE "LeadSearchPreset";

-- DropTable
DROP TABLE "LeadSource";

-- DropTable
DROP TABLE "Message";

-- DropTable
DROP TABLE "MobileAppFile";

-- DropTable
DROP TABLE "Permission";

-- DropTable
DROP TABLE "Person";

-- DropTable
DROP TABLE "PersonAttachment";

-- DropTable
DROP TABLE "PhoneContact";

-- DropTable
DROP TABLE "Pool";

-- DropTable
DROP TABLE "PoolOnUser";

-- DropTable
DROP TABLE "Project";

-- DropTable
DROP TABLE "Property";

-- DropTable
DROP TABLE "PropertyAreaSize";

-- DropTable
DROP TABLE "PropertyRoom";

-- DropTable
DROP TABLE "PropertyType";

-- DropTable
DROP TABLE "Role";

-- DropTable
DROP TABLE "RoleToUser";

-- DropTable
DROP TABLE "SearchPeriod";

-- DropTable
DROP TABLE "SessionContact";

-- DropTable
DROP TABLE "SystemActivity";

-- DropTable
DROP TABLE "SystemPhone";

-- DropTable
DROP TABLE "Update";

-- DropTable
DROP TABLE "User";

-- DropTable
DROP TABLE "UserLocation";

-- DropTable
DROP TABLE "UserSession";

-- DropTable
DROP TABLE "WebSource";

-- DropTable
DROP TABLE "Webhook";

-- DropTable
DROP TABLE "WebhookRequest";

-- DropTable
DROP TABLE "_BusinessProcessToWebhook";

-- DropTable
DROP TABLE "_ChatPermissionToChatType";

-- DropTable
DROP TABLE "_ChatTypeToContactType";

-- DropTable
DROP TABLE "_EmailDraftToFile";

-- DropTable
DROP TABLE "_EmailToEntity";

-- DropTable
DROP TABLE "_EmailToFile";

-- DropTable
DROP TABLE "_EntityToMessage";

-- DropTable
DROP TABLE "_LeadSearchPresetToLeadStatus";

-- DropTable
DROP TABLE "_LeadSearchPresetToTag";

-- DropTable
DROP TABLE "_LeadToTag";

-- DropTable
DROP TABLE "_PersonToTag";

-- DropTable
DROP TABLE "_TagToWebhook";

-- DropEnum
DROP TYPE "BusinessProcessEntity";

-- DropEnum
DROP TYPE "ChatCategory";

-- DropEnum
DROP TYPE "ItemType";

-- DropEnum
DROP TYPE "MessageType";

-- DropEnum
DROP TYPE "PermissionType";

-- DropEnum
DROP TYPE "PersonAttachmentType";

-- DropEnum
DROP TYPE "TagCategoryType";

-- DropEnum
DROP TYPE "UserStatus";

-- AddForeignKey
ALTER TABLE "FollowUpEvent" ADD CONSTRAINT "FollowUpEvent_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MeetingEvent" ADD CONSTRAINT "MeetingEvent_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE SET NULL ON UPDATE CASCADE;
