import { Inject } from '@nestjs/common';
import { Resolver, Query } from '@nestjs/graphql';
import { EventQueryService } from 'src/modules/event/query/event.service';

@Resolver()
export class EventQueryResolver {
  constructor(
    @Inject(EventQueryService) private eventService: EventQueryService,
  ) {}
}
