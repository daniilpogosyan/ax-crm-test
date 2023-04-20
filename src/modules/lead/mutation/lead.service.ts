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

    const hasPersonalInfo =
      params.firstName || params.lastName || params.secondName;
    // const color = colors[Numbers.getRandomInt(0, colors.length - 1)];
    // const animal = animals[Numbers.getRandomInt(0, animals.length - 1)];

    const displayName = hasPersonalInfo
      ? [params.firstName, params.secondName, params.lastName]
          .filter((x) => x)
          .join(' ')
      : 'Guest';

    // if (!params.avatarId) {
    //   params.avatarId = await this.avatarService
    //     .getAvatar(color.title, hasPersonalInfo ? displayName[0] : animal.title)
    //     .then((x) => x.id);
    // }

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

    const data: Prisma.LeadCreateInput = {
      seen: true,
      budget: params.budget,
      // itemType: ItemType.property,
      // sourceDetails: params.sourceDetails,
      ...(tags.length > 0 ? { tags: { connect: tags } } : {}),
      status: { connect: { id: CoreEnums.LeadStatusIndex.new } },
      person: {
        create: {
          displayName,
          firstName: params.firstName,
          secondName: params.secondName,
          lastName: params.lastName,
          birthDate: params.birthDate,
          // avatar: { connect: { id: params.avatarId } },
        },
      },
    };

    const lead = await this.prisma.lead.create({ data });

    return lead;
  }

  updateLead(args: UpdateLeadArgs) {
    const { leadId: id, ...data } = args.params;

    // return this.prisma.lead.update({
    //   where: {
    //     id,
    //   },
    //   data,
    // });
  }
}
