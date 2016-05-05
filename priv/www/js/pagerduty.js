dispatcher_add(function(sammy) {
    sammy.get('#/pd', function() {
         render({}, 'pagerduty', '#/pd');
    });
    sammy.get('#/pd/history', function() {
         render({}, 'pd-history', '#/pd/history');
    });
});

NAVIGATION['PagerDuty'] = [{
    'Overview': ['#/pd', 'monitoring'],
    'History':  ['#/pd/history', 'monitoring']},
    'monitoring'];

HELP['pd-service-key'] = 'Also know as the integration key, the service for categorizing alerts';
