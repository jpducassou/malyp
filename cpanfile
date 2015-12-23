requires 'perl', '5.010001';

requires 'Parse::Yapp';

on 'test' => sub {
	requires 'Test::More', 0.98;
};

on 'develop' => sub {
	requires 'Test::Perl::Critic';
	requires 'Perl::Critic::Bangs';
	requires 'Test::Pod';
};

