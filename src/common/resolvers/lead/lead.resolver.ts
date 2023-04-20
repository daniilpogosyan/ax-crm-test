import {
  CityModel,
  CountryModel,
  LanguageModel,
  LeadModel,
  NationalityModel,
} from '@common/models';
import { PrismaService } from 'src/modules/prisma/prisma.service';
import { Parent, ResolveField, Resolver } from '@nestjs/graphql';
import { Lead, Tag } from '@prisma/client';
import { Inject } from '@nestjs/common';

@Resolver(() => LeadModel)
export class LeadModelResolver {
  constructor(@Inject(PrismaService) private prisma: PrismaService) {}
  @ResolveField(() => CityModel)
  city(@Parent() lead: Lead & { tags: Tag[] }) {
    return this.prisma.city.findUnique({
      where: {
        id: lead.tags.find((tag) => tag.cityId).cityId,
      },
    });
  }
  @ResolveField(() => CountryModel)
  country(@Parent() lead: Lead & { tags: Tag[] }) {
    return this.prisma.city.findUnique({
      where: {
        id: lead.tags.find((tag) => tag.cityId).cityId,
      },
    });
  }
  @ResolveField(() => [LanguageModel])
  languages(@Parent() lead: Lead & { tags: Tag[] }) {
    return this.prisma.language.findMany({
      where: {
        id: {
          in: lead.tags
            .filter((tag) => tag.languageId)
            .map((languageTag: any) => languageTag.languageId),
        },
      },
    });
  }
  @ResolveField(() => NationalityModel)
  nationality(@Parent() lead: Lead & { tags: Tag[] }) {
    return this.prisma.nationality.findUnique({
      where: {
        id: lead.tags.find((tag) => tag.nationalityId).nationalityId,
      },
    });
  }
}
