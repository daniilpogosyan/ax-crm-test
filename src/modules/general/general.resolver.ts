import {
  CityModel,
  CountryModel,
  LanguageModel,
  NationalityModel,
} from '@common/models';
import { Inject } from '@nestjs/common';
import { Args, Int, Resolver, Query } from '@nestjs/graphql';
import { GeneralService } from 'src/modules/general/general.service';

@Resolver()
export class GeneralResolver {
  constructor(@Inject(GeneralService) private generalService: GeneralService) {}

  @Query(() => [CountryModel])
  fetchCountries() {
    return this.generalService.fetchCountries();
  }

  @Query(() => [CityModel])
  fetchCities(@Args({ name: 'countryId', type: () => Int }) countryId: number) {
    return this.generalService.fetchCities(countryId);
  }

  @Query(() => [LanguageModel])
  fetchLanguages() {
    return this.generalService.fetchLanguages();
  }

  @Query(() => [NationalityModel])
  fetchNationality() {
    return this.generalService.fetchNationality();
  }
}
