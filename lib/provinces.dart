var controlled_province = {
// Germany
    'Ank': 'Germany',
    'Con': 'Germany',
    'Smy': 'Germany',
// England
    'Lon': 'England',
    'Edi': 'England',
    'Lvp': 'England',
// France
    'Par': 'France',
    'Mar': 'France',
    'Bre': 'France',
// Italy
    'Rom': 'Italy',
    'Ven': 'Italy',
    'Nap': 'Italy',
// Turkey
    'Ank': 'Turkey',
    'Con': 'Turkey',
    'Smy': 'Turkey',
// Russia
    'War': 'Russia',
    'Mos': 'Russia',
    'Sev': 'Russia',
    'Stp': 'Russia',
};

var uncontrolled_province = {
    'Bel': -1,
    'Bul': -1,
    'Den': -1,
    'Gre': -1,
    'Hol': -1,
    'Nwy': -1,
    'Por': -1,
    'Rum': -1,
    'Ser': -1,
    'Spa': -1,
    'Swe': -1,
    'Tun': -1
};

bool province_is_in_country(country, province){
    controlled_province.forEach((this.country, this.province) => {
        if (this.country == country) {
            return true;
        };
      );
    return false;
    };
}


void main(){
print(province_is_in_country('Germany', 'Bel' ));
}
