import React from 'react';
import { AreaChart, Area, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from 'recharts';
import { Cloud, CloudRain, Sun, CloudSun, Brain, TrendingUp, Target } from 'lucide-react';

const forecastData = [
  { day: 'Today', predicted: 34.6, confidence: 'high', weather: 'sunny' },
  { day: 'Tomorrow', predicted: 31.2, confidence: 'high', weather: 'partly-cloudy' },
  { day: 'Mon', predicted: 28.4, confidence: 'medium', weather: 'cloudy' },
  { day: 'Tue', predicted: 18.6, confidence: 'medium', weather: 'rainy' },
  { day: 'Wed', predicted: 35.8, confidence: 'low', weather: 'sunny' },
];

const WeatherIcon = ({ weather }: { weather: string }) => {
  const iconProps = { className: 'w-6 h-6' };
  switch (weather) {
    case 'sunny':
      return <Sun {...iconProps} className="w-6 h-6 text-amber-500" />;
    case 'partly-cloudy':
      return <CloudSun {...iconProps} className="w-6 h-6 text-slate-500" />;
    case 'cloudy':
      return <Cloud {...iconProps} className="w-6 h-6 text-slate-400" />;
    case 'rainy':
      return <CloudRain {...iconProps} className="w-6 h-6 text-blue-500" />;
    default:
      return <Sun {...iconProps} />;
  }
};

export function ForecastScreen() {
  return (
    <div className="flex flex-col gap-6 pb-6">
      {/* Header */}
      <div className="bg-gradient-to-br from-slate-900 via-blue-900 to-slate-900 text-white p-6 rounded-b-3xl relative overflow-hidden">
        <div className="absolute inset-0 opacity-10">
          <div className="absolute top-0 left-0 w-32 h-32 border border-white rounded-full"></div>
        </div>
        <div className="relative z-10">
          <div className="flex items-center gap-2 mb-2">
            <Brain className="w-5 h-5 text-purple-400" />
            <span className="text-xs text-purple-400 uppercase tracking-wider">Predictive Intelligence</span>
          </div>
          <h1 className="text-2xl mb-1">Production Forecast</h1>
          <p className="text-slate-300 text-sm">AI-powered predictions for optimal planning</p>
        </div>
      </div>

      <div className="px-4 flex flex-col gap-5">
        {/* Value Prop: How Forecasting Helps */}
        <div className="bg-gradient-to-r from-purple-500 to-purple-600 rounded-2xl p-5 text-white shadow-lg">
          <div className="flex items-start gap-3 mb-3">
            <div className="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center flex-shrink-0">
              <Target className="w-5 h-5" />
            </div>
            <div>
              <h3 className="text-lg mb-1">Intelligence Drives Planning</h3>
              <p className="text-purple-50 text-sm leading-relaxed">
                Our ML forecasting is <span className="text-white">94.2% accurate</span>, helping you plan energy usage and predict when to draw from storage vs. grid—optimizing costs automatically.
              </p>
            </div>
          </div>
          <div className="flex items-center justify-between pt-3 border-t border-white/20">
            <span className="text-sm text-purple-50">Savings from smart timing:</span>
            <span className="text-xl">R42/month</span>
          </div>
        </div>

        {/* Main Forecast Card */}
        <div className="bg-gradient-to-br from-emerald-50 to-white rounded-2xl border border-emerald-200 p-6">
          <div className="flex items-start justify-between mb-4">
            <div>
              <h3 className="text-slate-900 mb-1">Tomorrow's Forecast</h3>
              <p className="text-sm text-slate-600">January 18, 2026</p>
            </div>
            <CloudSun className="w-12 h-12 text-slate-600" />
          </div>
          <div className="flex items-baseline gap-2 mb-4">
            <span className="text-5xl text-slate-900">31.2</span>
            <span className="text-2xl text-slate-500">kWh</span>
          </div>
          <div className="flex items-center gap-2">
            <span className="text-sm text-slate-600">Prediction Confidence:</span>
            <div className="flex items-center gap-1.5">
              <div className="px-3 py-1 bg-emerald-100 text-emerald-700 rounded-full text-sm">
                High
              </div>
              <span className="text-sm text-slate-500">92%</span>
            </div>
          </div>
        </div>

        {/* Forecast Chart */}
        <div className="bg-white rounded-2xl border border-slate-200 p-4">
          <h3 className="text-slate-900 mb-1">5-Day Forecast</h3>
          <p className="text-sm text-slate-500 mb-4">Predicted solar production</p>
          <ResponsiveContainer width="100%" height={220}>
            <AreaChart data={forecastData}>
              <defs>
                <linearGradient id="colorPredicted" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="#3B82F6" stopOpacity={0.3}/>
                  <stop offset="95%" stopColor="#3B82F6" stopOpacity={0}/>
                </linearGradient>
              </defs>
              <CartesianGrid strokeDasharray="3 3" stroke="#E2E8F0" />
              <XAxis 
                dataKey="day" 
                tick={{ fontSize: 12, fill: '#64748B' }}
                tickLine={false}
                axisLine={{ stroke: '#E2E8F0' }}
              />
              <YAxis 
                tick={{ fontSize: 12, fill: '#64748B' }}
                tickLine={false}
                axisLine={{ stroke: '#E2E8F0' }}
                label={{ value: 'kWh', angle: -90, position: 'insideLeft', style: { fontSize: 12, fill: '#64748B' } }}
              />
              <Tooltip 
                contentStyle={{ 
                  backgroundColor: '#1E293B', 
                  border: 'none', 
                  borderRadius: '8px',
                  color: '#fff'
                }}
              />
              <Area 
                type="monotone" 
                dataKey="predicted" 
                stroke="#3B82F6" 
                strokeWidth={3}
                fill="url(#colorPredicted)"
              />
            </AreaChart>
          </ResponsiveContainer>
        </div>

        {/* Daily Breakdown */}
        <div className="bg-white rounded-2xl border border-slate-200 p-4">
          <h3 className="text-slate-900 mb-4">Daily Breakdown</h3>
          <div className="space-y-3">
            {forecastData.map((day, index) => (
              <div 
                key={index}
                className="flex items-center justify-between p-3 bg-slate-50 rounded-xl"
              >
                <div className="flex items-center gap-3">
                  <WeatherIcon weather={day.weather} />
                  <div>
                    <div className="text-slate-900">{day.day}</div>
                    <div className="text-xs text-slate-500 capitalize">{day.confidence} confidence</div>
                  </div>
                </div>
                <div className="text-right">
                  <div className="text-slate-900">{day.predicted} kWh</div>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Forecast Insights */}
        <div className="bg-gradient-to-br from-blue-50 to-white rounded-2xl border border-blue-200 p-4">
          <h3 className="text-slate-900 mb-3">Forecast Insights</h3>
          <div className="space-y-3 text-sm">
            <div className="flex items-start gap-2">
              <div className="w-1.5 h-1.5 rounded-full bg-blue-500 mt-1.5"></div>
              <p className="text-slate-600">
                <span className="text-slate-900">Tuesday</span> shows reduced output due to forecasted rain. Expected production: 18.6 kWh (46% below average).
              </p>
            </div>
            <div className="flex items-start gap-2">
              <div className="w-1.5 h-1.5 rounded-full bg-blue-500 mt-1.5"></div>
              <p className="text-slate-600">
                <span className="text-slate-900">Wednesday</span> recovery expected with clear skies. Production should return to 35.8 kWh.
              </p>
            </div>
            <div className="flex items-start gap-2">
              <div className="w-1.5 h-1.5 rounded-full bg-blue-500 mt-1.5"></div>
              <p className="text-slate-600">
                Weekly forecast confidence is <span className="text-slate-900">high</span> for the next 48 hours, medium beyond that.
              </p>
            </div>
          </div>
        </div>

        {/* Model Information */}
        <div className="bg-slate-50 rounded-xl p-4 text-center">
          <p className="text-xs text-slate-500">
            Forecasts powered by AI combining weather data, historical performance, and seasonal patterns.
            <br />
            Updated hourly • Accuracy: 89%
          </p>
        </div>
      </div>
    </div>
  );
}