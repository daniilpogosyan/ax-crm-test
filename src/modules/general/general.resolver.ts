import {
  CityModel,
  CountryModel,
  LanguageModel,
  NationalityModel,
} from '@common/models';
import { PrismaService } from 'src/modules/prisma/prisma.service';
import { Inject } from '@nestjs/common';
import { Args, Int, Resolver, Query } from '@nestjs/graphql';

@Resolver()
export class GeneralResolver {
  constructor(@Inject(PrismaService) private prisma: PrismaService) {}

  @Query(() => [CountryModel])
  fetchCountries() {
    return this.prisma.country.findMany();
  }

  @Query(() => [CityModel])
  fetchCities(@Args({ name: 'countryId', type: () => Int }) countryId: number) {
    return this.prisma.city.findMany({
      where: { countryId },
    });
  }

  @Query(() => [LanguageModel])
  fetchLanguages() {
    return this.prisma.language.findMany();
  }

  @Query(() => [NationalityModel])
  fetchNationality() {
    return this.prisma.nationality.findMany();
  }
}
