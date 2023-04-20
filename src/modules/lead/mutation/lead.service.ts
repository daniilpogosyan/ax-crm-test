import { PrismaService } from 'src/modules/prisma/prisma.service';
import { Inject, Injectable } from '@nestjs/common';
import {
  CreateLeadArgs,
  UpdateLeadArgs,
} from 'src/modules/lead/mutation/lead.dto';
import { Prisma } from '@prisma/client';
import * as CoreEnums from '@common/core';

@Injectable()
export class LeadMutationService {
  constructor(@Inject(PrismaService) private prisma: PrismaService) {}

  async createLead({ params }: CreateLeadArgs) {
    // const [colors, animals] = await this.prisma.$transaction([
    //   this.prisma.color.findMany({ where: { secondary: { not: null } } }),
    //   this.prisma.animal.findMany(),
    // ]);

    // const color = colors[Numbers.getRandomInt(0, colors.length - 1)];
    // const animal = animals[Numbers.getRandomInt(0, animals.length - 1)];

    // if (!params.avatarId) {
    //   params.avatarId = await this.avatarService
    //     .getAvatar(color.title, hasPersonalInfo ? displayName[0] : animal.title)
    //     .then((x) => x.id);
    // }

    const tags = this.tagsToConnect(params);

    const data: Prisma.LeadCreateInput = {
      seen: true,
      budget: params.budget,
      // itemType: ItemType.property,
      // sourceDetails: params.sourceDetails,
      ...(tags.length > 0 ? { tags: { connect: tags } } : {}),
      status: { connect: { id: CoreEnums.LeadStatusIndex.new } },
      person: {
        create: {
          displayName: this.getDisplayName(params),
          firstName: params.firstName,
          secondName: params.secondName,
          lastName: params.lastName,
          birthDate: params.birthDate,
          // avatar: { connect: { id: params.avatarId } },
        },
      },
    };

    const lead = await this.prisma.lead.create({
      data,
      include: {
        person: true,
        status: true,
        tags: {
          include: {
            category: true,
            city: true,
            country: true,
            language: true,
            nationality: true,
          },
        },
      },
    });

    return lead;
  }

  async updateLead({ params }: UpdateLeadArgs) {
    const lead = await this.prisma.lead.findUnique({
      where: { id: params.leadId },
    });

    const tags = this.tagsToConnect(params);

    return this.prisma.lead.update({
      where: {
        id: params.leadId,
      },
      include: {
        person: true,
        status: true,
        tags: {
          include: {
            category: true,
            city: true,
            country: true,
            language: true,
            nationality: true,
          },
        },
      },
      data: {
        budget: params.budget,
        ...(tags.length > 0 ? { tags: { connect: tags } } : {}),
        person: {
          update: {
            birthDate: params.birthDate,
            displayName: this.getDisplayName(params),
            firstName: params.firstName,
            lastName: params.lastName,
            secondName: params.secondName,
          },
        },
        status: {
          connect: {
            id: params.statusId,
          },
        },
      },
    });
  }

  private getDisplayName({
    firstName,
    lastName,
    secondName,
  }: {
    firstName?: string;
    lastName?: string;
    secondName?: string;
  }) {
    const hasPersonalInfo = firstName || lastName || secondName;

    const displayName = hasPersonalInfo
      ? [firstName, secondName, lastName].filter((x) => x).join(' ')
      : 'Guest';
    return displayName;
  }

  private tagsToConnect(params: any) {
    const tags: Prisma.TagWhereUniqueInput[] = [];

    // if (params.propertyTypeId) tags.push({ propertyTypeId: params.propertyTypeId });
    // if (params.areaSizeId) tags.push({ propertyAreaSizeId: params.areaSizeId });
    // if (params.bedroomsId) tags.push({ propertyRoomId: params.bedroomsId });

    // if (params.channelSourceId) tags.push({ channelSourceId: params.channelSourceId });
    if (params.nationalityId)
      tags.push({ nationalityId: params.nationalityId });
    // if (params.intentionId) tags.push({ leadIntentionId: params.intentionId });
    // if (params.leadSourceId) tags.push({ leadSourceId: params.leadSourceId });
    // if (params.webSourceId) tags.push({ webSourceId: params.webSourceId });
    // if (params.adSourceId) tags.push({ adSourceId: params.adSourceId });
    if (params.countryId) tags.push({ countryId: params.countryId });
    if (params.cityId) tags.push({ cityId: params.cityId });

    // if (params.communityIds) tags.push(...params.communityIds.map((x) => ({ communityId: x })));
    if (params.languageIds)
      tags.push(...params.languageIds.map((x) => ({ languageId: x })));
    // if (params.projectIds) tags.push(...params.projectIds.map((x) => ({ projectId: x })));

    return tags;
  }
}
