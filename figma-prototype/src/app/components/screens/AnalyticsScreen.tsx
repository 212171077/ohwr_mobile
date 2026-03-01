import React, { useState } from 'react';
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid, Legend, ComposedChart, Line } from 'recharts';
import { AlertTriangle, Brain, TrendingUp, Award, Target, ArrowUp, ArrowDown, AlertCircle } from 'lucide-react';

const dailyData = [
  { day: 'Mon', current: 32.4, previous: 28.6, ai_optimized: 2.4 },
  { day: 'Tue', current: 34.8, previous: 31.2, ai_optimized: 3.2 },
  { day: 'Wed', current: 28.2, previous: 33.1, ai_optimized: 1.8 },
  { day: 'Thu', current: 36.1, previous: 29.8, ai_optimized: 4.1 },
  { day: 'Fri', current: 33.7, previous: 34.2, ai_optimized: 2.9 },
  { day: 'Sat', current: 35.2, previous: 32.9, ai_optimized: 3.5 },
  { day: 'Sun', current: 34.6, previous: 30.4, ai_optimized: 3.2 },
];

const weeklyData = [
  { week: 'Week 1', current: 218, previous: 195, ai_optimized: 18 },
  { week: 'Week 2', current: 224, previous: 212, ai_optimized: 22 },
  { week: 'Week 3', current: 198, previous: 218, ai_optimized: 14 },
  { week: 'Week 4', current: 236, previous: 201, ai_optimized: 28 },
];

const monthlyData = [
  { month: 'Aug', current: 756, previous: 682, ai_optimized: 62 },
  { month: 'Sep', current: 812, previous: 754, ai_optimized: 71 },
  { month: 'Oct', current: 768, previous: 796, ai_optimized: 58 },
  { month: 'Nov', current: 698, previous: 712, ai_optimized: 48 },
  { month: 'Dec', current: 654, previous: 686, ai_optimized: 42 },
  { month: 'Jan', current: 876, previous: 768, ai_optimized: 86 },
];

export function AnalyticsScreen() {
  const [timeRange, setTimeRange] = useState<'daily' | 'weekly' | 'monthly'>('weekly');

  const dataMap = {
    daily: dailyData,
    weekly: weeklyData,
    monthly: monthlyData,
  };

  const totalAIOptimized = timeRange === 'daily' ? 21.1 : timeRange === 'weekly' ? 82 : 367;

  return (
    <div className="flex flex-col gap-6 pb-6">
      {/* Header */}
      <div className="bg-gradient-to-br from-slate-900 via-blue-900 to-slate-900 text-white p-6 rounded-b-3xl relative overflow-hidden">
        <div className="absolute inset-0 opacity-10">
          <div className="absolute top-0 right-0 w-40 h-40 border border-white rounded-full"></div>
        </div>
        <div className="relative z-10">
          <div className="flex items-center gap-2 mb-2">
            <Brain className="w-5 h-5 text-blue-400" />
            <span className="text-xs text-blue-400 uppercase tracking-wider">Performance Monitoring</span>
          </div>
          <h1 className="text-2xl mb-1">System Analytics</h1>
          <p className="text-slate-300 text-sm">Real-time monitoring & trend analysis</p>
        </div>
      </div>

      <div className="px-4 flex flex-col gap-5">
        {/* Current Performance Status */}
        <div className="bg-gradient-to-br from-emerald-500 to-emerald-600 rounded-2xl p-5 text-white shadow-lg">
          <div className="flex items-center justify-between mb-3">
            <div>
              <div className="text-emerald-100 text-sm mb-1">Today's Status</div>
              <div className="text-3xl flex items-baseline gap-2">
                34.6 kWh
                <span className="text-lg text-emerald-200">↑ 8.2%</span>
              </div>
            </div>
            <div className="w-14 h-14 bg-white/20 rounded-2xl flex items-center justify-center">
              <TrendingUp className="w-7 h-7" />
            </div>
          </div>
          <p className="text-emerald-50 text-sm">
            Exceeding AI forecast by 2.6 kWh — system performing above expectations
          </p>
        </div>

        {/* Performance Comparison Grid */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5">
          <h3 className="text-slate-900 mb-4">Performance Comparison</h3>
          <div className="space-y-4">
            {/* This Month vs Last Month */}
            <div className="p-4 bg-slate-50 rounded-xl">
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm text-slate-600">This Month vs Last Month</span>
                <div className="flex items-center gap-1 text-emerald-600">
                  <ArrowUp className="w-4 h-4" />
                  <span className="font-medium">14.2%</span>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <div className="flex-1">
                  <div className="text-xs text-slate-500 mb-1">January 2026</div>
                  <div className="text-lg text-slate-900">876 kWh</div>
                </div>
                <div className="w-px h-10 bg-slate-200"></div>
                <div className="flex-1">
                  <div className="text-xs text-slate-500 mb-1">December 2025</div>
                  <div className="text-lg text-slate-500">768 kWh</div>
                </div>
              </div>
            </div>

            {/* Expected vs Actual */}
            <div className="p-4 bg-blue-50 rounded-xl border border-blue-100">
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm text-slate-600">Expected vs Actual (Today)</span>
                <div className="flex items-center gap-1 text-emerald-600">
                  <ArrowUp className="w-4 h-4" />
                  <span className="font-medium">8.2%</span>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <div className="flex-1">
                  <div className="text-xs text-slate-500 mb-1">Actual Production</div>
                  <div className="text-lg text-slate-900">34.6 kWh</div>
                </div>
                <div className="w-px h-10 bg-blue-200"></div>
                <div className="flex-1">
                  <div className="text-xs text-slate-500 mb-1">AI Predicted</div>
                  <div className="text-lg text-slate-500">32.0 kWh</div>
                </div>
              </div>
              <div className="mt-3 pt-3 border-t border-blue-200">
                <p className="text-xs text-blue-800">
                  <span className="font-medium">Deviation:</span> +2.6 kWh above forecast — excellent conditions
                </p>
              </div>
            </div>

            {/* With AI vs Without AI */}
            <div className="p-4 bg-emerald-50 rounded-xl border border-emerald-100">
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm text-slate-600">With AI vs Standard Monitoring</span>
                <div className="flex items-center gap-1 text-emerald-600">
                  <ArrowUp className="w-4 h-4" />
                  <span className="font-medium">17.9%</span>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <div className="flex-1">
                  <div className="text-xs text-slate-500 mb-1">AI Optimized</div>
                  <div className="text-lg text-emerald-700 font-medium">R212.80</div>
                </div>
                <div className="w-px h-10 bg-emerald-200"></div>
                <div className="flex-1">
                  <div className="text-xs text-slate-500 mb-1">Standard System</div>
                  <div className="text-lg text-slate-500">R180.40</div>
                </div>
              </div>
              <div className="mt-3 pt-3 border-t border-emerald-200">
                <p className="text-xs text-emerald-800">
                  <span className="font-medium">Intelligence bonus:</span> +R32.40 additional monthly revenue
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* Time Range Selector */}
        <div className="flex gap-2 bg-slate-100 p-1 rounded-xl">
          <button
            onClick={() => setTimeRange('daily')}
            className={`flex-1 py-2.5 px-4 rounded-lg text-sm transition-all ${
              timeRange === 'daily' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-600'
            }`}
          >
            Daily
          </button>
          <button
            onClick={() => setTimeRange('weekly')}
            className={`flex-1 py-2.5 px-4 rounded-lg text-sm transition-all ${
              timeRange === 'weekly' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-600'
            }`}
          >
            Weekly
          </button>
          <button
            onClick={() => setTimeRange('monthly')}
            className={`flex-1 py-2.5 px-4 rounded-lg text-sm transition-all ${
              timeRange === 'monthly' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-600'
            }`}
          >
            Monthly
          </button>
        </div>

        {/* Main Analytics Chart with AI Overlay */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5 shadow-sm">
          <div className="flex items-start justify-between mb-1">
            <div>
              <h3 className="text-slate-900 mb-1">Performance Trends</h3>
              <p className="text-sm text-slate-500">Current vs Previous + AI Impact</p>
            </div>
            <div className="flex items-center gap-1.5 px-2 py-1 bg-emerald-50 text-emerald-700 rounded-lg text-xs">
              <Award className="w-3 h-3" />
              <span>+{((totalAIOptimized / 876) * 100).toFixed(1)}%</span>
            </div>
          </div>
          <ResponsiveContainer width="100%" height={300}>
            <ComposedChart data={dataMap[timeRange]}>
              <CartesianGrid strokeDasharray="3 3" stroke="#E2E8F0" />
              <XAxis 
                dataKey={timeRange === 'daily' ? 'day' : timeRange === 'weekly' ? 'week' : 'month'}
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
                  color: '#fff',
                  padding: '12px'
                }}
              />
              <Legend 
                wrapperStyle={{ fontSize: '12px', paddingTop: '16px' }}
                iconType="circle"
              />
              <Bar dataKey="previous" fill="#CBD5E1" name="Previous Period" radius={[4, 4, 0, 0]} />
              <Bar dataKey="current" fill="#10B981" name="Current Period" radius={[4, 4, 0, 0]} />
              <Line 
                type="monotone" 
                dataKey="ai_optimized" 
                stroke="#F59E0B" 
                strokeWidth={3}
                name="AI Boost"
                dot={{ fill: '#F59E0B', r: 4 }}
              />
            </ComposedChart>
          </ResponsiveContainer>
        </div>

        {/* Performance Deviations Alert */}
        <div className="bg-gradient-to-br from-amber-50 to-white rounded-2xl border border-amber-200 p-5">
          <div className="flex gap-3 mb-4">
            <div className="flex-shrink-0 w-10 h-10 rounded-xl bg-amber-100 flex items-center justify-center">
              <AlertCircle className="w-5 h-5 text-amber-600" />
            </div>
            <div className="flex-1">
              <h4 className="text-slate-900 mb-1">Deviation Detected</h4>
              <p className="text-sm text-slate-600">
                Northwest panel array performing <span className="text-amber-700 font-medium">12% below expected</span> — AI flagged for attention
              </p>
            </div>
          </div>
          <div className="space-y-2 bg-white rounded-xl p-4 border border-amber-100">
            <div className="flex justify-between text-sm">
              <span className="text-slate-600">Expected Output:</span>
              <span className="text-slate-900">39.2 kWh</span>
            </div>
            <div className="flex justify-between text-sm">
              <span className="text-slate-600">Actual Output:</span>
              <span className="text-amber-700 font-medium">34.6 kWh</span>
            </div>
            <div className="flex justify-between text-sm">
              <span className="text-slate-600">Deviation:</span>
              <span className="text-red-600 flex items-center gap-1">
                <ArrowDown className="w-3 h-3" />
                -4.6 kWh (-11.7%)
              </span>
            </div>
            <div className="pt-3 mt-3 border-t border-slate-100 space-y-2">
              <div className="flex justify-between text-sm">
                <span className="text-slate-600">Likely Cause:</span>
                <span className="text-amber-700 font-medium">Panel soiling</span>
              </div>
              <div className="flex justify-between text-sm">
                <span className="text-slate-600">Recommended Action:</span>
                <span className="text-blue-600 font-medium">Schedule cleaning</span>
              </div>
              <div className="flex justify-between text-sm">
                <span className="text-slate-600">Potential Recovery:</span>
                <span className="text-emerald-600 font-medium">+R18/day</span>
              </div>
            </div>
          </div>
        </div>

        {/* Intelligence Insights */}
        <div className="bg-gradient-to-br from-blue-50 to-white rounded-2xl border border-blue-200 p-5">
          <div className="flex items-center gap-2 mb-4">
            <Brain className="w-5 h-5 text-blue-600" />
            <h3 className="text-slate-900">AI Insights</h3>
          </div>
          <div className="space-y-3">
            <div className="flex items-start gap-3 p-3 bg-white rounded-xl">
              <div className="w-8 h-8 rounded-lg bg-emerald-100 flex items-center justify-center flex-shrink-0 mt-0.5">
                <Target className="w-4 h-4 text-emerald-600" />
              </div>
              <div className="flex-1">
                <div className="text-sm text-slate-900 mb-1">Optimal Performance Window</div>
                <p className="text-xs text-slate-600">System consistently peaks between 11AM-2PM. AI scheduling recommendations could increase efficiency by 3-5%.</p>
              </div>
            </div>
            <div className="flex items-start gap-3 p-3 bg-white rounded-xl">
              <div className="w-8 h-8 rounded-lg bg-blue-100 flex items-center justify-center flex-shrink-0 mt-0.5">
                <TrendingUp className="w-4 h-4 text-blue-600" />
              </div>
              <div className="flex-1">
                <div className="text-sm text-slate-900 mb-1">Seasonal Trend Detected</div>
                <p className="text-xs text-slate-600">Performance improving 2.1% week-over-week as we approach autumn. Forecasting 12% uplift by March.</p>
              </div>
            </div>
          </div>
        </div>

        {/* Key Performance Indicators with Benchmarks */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-slate-900">Performance vs Industry</h3>
            <div className="px-2 py-1 bg-emerald-50 text-emerald-700 rounded-lg text-xs">
              Top 5% Nationally
            </div>
          </div>
          <div className="space-y-4">
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-slate-600">Capacity Factor</span>
                <div className="text-right">
                  <span className="text-slate-900 font-medium">18.6%</span>
                  <span className="text-xs text-emerald-600 ml-2">vs 15.2% avg</span>
                </div>
              </div>
              <div className="w-full bg-slate-100 rounded-full h-2 overflow-hidden">
                <div className="bg-blue-500 h-2 rounded-full relative" style={{ width: '18.6%' }}>
                  <div className="absolute right-0 top-0 bottom-0 w-1 bg-blue-700"></div>
                </div>
                <div className="absolute w-full h-2 -mt-2">
                  <div className="relative" style={{ left: '15.2%', width: '1px', height: '100%', background: '#94A3B8' }}></div>
                </div>
              </div>
            </div>
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-slate-600">Energy Yield Efficiency</span>
                <div className="text-right">
                  <span className="text-slate-900 font-medium">94.2%</span>
                  <span className="text-xs text-emerald-600 ml-2">vs 87.1% avg</span>
                </div>
              </div>
              <div className="w-full bg-slate-100 rounded-full h-2">
                <div className="bg-emerald-500 h-2 rounded-full" style={{ width: '94.2%' }}></div>
              </div>
            </div>
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-slate-600">System Availability</span>
                <div className="text-right">
                  <span className="text-slate-900 font-medium">99.8%</span>
                  <span className="text-xs text-emerald-600 ml-2">vs 97.3% avg</span>
                </div>
              </div>
              <div className="w-full bg-slate-100 rounded-full h-2">
                <div className="bg-emerald-500 h-2 rounded-full" style={{ width: '99.8%' }}></div>
              </div>
            </div>
          </div>
        </div>

        {/* ROI Impact Statement */}
        <div className="bg-gradient-to-br from-slate-900 to-blue-900 rounded-2xl p-5 text-white">
          <div className="flex items-center gap-2 mb-3">
            <Award className="w-5 h-5 text-emerald-400" />
            <span className="text-emerald-400 text-sm uppercase tracking-wider">Monitoring Impact</span>
          </div>
          <p className="text-slate-100 text-sm mb-4">
            Real-time monitoring enables <span className="text-white text-lg">early detection</span> of 3 anomalies this month, preventing <span className="text-emerald-400 text-lg">R1,240</span> in potential losses.
          </p>
          <div className="flex items-center justify-between pt-3 border-t border-white/20">
            <span className="text-slate-300 text-sm">Average response time:</span>
            <span className="text-lg">2.4 hours</span>
          </div>
        </div>
      </div>
    </div>
  );
}